class UsersController < ApplicationController

  before_action :find_session_user, only: [:index, :edit, :update, :network]
  # before_action :find_user_by_route, only: [:index]

  def index
    @resources = @user.resources
    @matches = find_matches @user                 # defined below
    @like_requests = find_like_requests @user     # defined below

    existing_categories = []                      # populates the carousel dropdown with resource to be searched for

    if @user.wants_bike == true
      existing_categories << "bike"
    end

    if @user.wants_vehicle == true
      existing_categories << "vehicle"
    end

    if @user.wants_social == true
      existing_categories << "social"
    end

    if @user.wants_pet == true
      existing_categories << "pet"
    end

    if @user.wants_housing == true
     existing_categories << "housing"
    end

    @avail_resources = existing_categories        # instance variable to be used in view
  end

  def login
  end

  def load_carousel
    @filter = params[:category]                                       #make this params[:resource category] once a filter dropdown is setup
    @carousel_users = []
    @has_users = ResourcesUser.wanted_by_and_categorized_by(session[:user_id], @filter).not_liked.order(score: :desc)
    @carousel_users = @has_users.map{|owner| owner.owning_user}
    @match_list = @carousel_users - [@carousel_users.first]
    if @carousel_users == []
      flash[:alert] = "No current owners with #{@filter}. Check back soon to browse and share!"
      redirect_to user_home_path(session[:user_id])
    end
  end

  def show
    # We have to use :user_id instead of just :id because the find_reviewable
    # method will be looking for something called *_id
    @user = User.find params[:user_id]
    # grab the reviews for the user to be shown
    @reviews = @user.reviews
    @session_user = User.find session[:user_id]
    # determine if the session user and the user whose profile is to be shown have matched
    # this will affect what's viewable on the profile page
    @match = two_users_matched @user, @session_user
  end

  def edit
  end

  def create
    @resource = Resource.new                                            # needed for new_user_resources_path
    @user = User.from_omniauth(env["omniauth.auth"], params[:provider]) # facebook OmniAuth
    if @user.save
      session[:user_id] = @user.id                                      # saves session[:user_id]
      if Resource.exists?(user_id: session[:user_id])
        redirect_to user_home_path(@user), notice: "signed in!"         # if resources already exist, send them to their dashboard
      else
        redirect_to newwant_user_resource_path(@user)                   # otherwise, direct them to add resources.
      end
    else
      flash[:alert] = "Login Error"
      redirect_to new_user_resource_path
    end
  end

  def update
    @user.update_attributes user_params
    full_name = @user.first_name + " " + @user.last_name
    @user.update_attributes name:full_name

    if @user.save
      redirect_to user_show_path(@user)
    else
      flash.now[:alert] = "Please correct the following input errors"
      render :edit
    end
  end

  def interests                                       # get interests page
    @user = User.find(session[:user_id])
  end

  def interests_add                                   # populate user's interests
    @user = User.find(session[:user_id])
    @user.interests =[]
    params[:user][:interests].each{|x| @user.interests << x}
    @user.update_attribute(:location, params[:user][:location])
    update_score
    redirect_to user_home_path(session[:user_id])
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "You are now logged out!"
  end

  # def hidden                                            # not used in production
  #   @user = User.new                                    # purpose was to modify information
  # end

  # def secret                                          # not used in production.
  # @user = User.find_by(email:params[:user][:email])   # purpose was to modify information
  # session[:user_id] = @user.id
  # redirect_to user_home_path(@user)
  # end

private

  #
  # 'find_matches' returns an array of objects
  # Each object represents a "match," which consists of three key/value pairs:
  #   matched_user: the other guy's id (who either liked you and you accepted
  #     or you liked him and he accepted)
  #   category: the resource category (string)
  #   you_have: boolean.  If true, the match is based on you having what the other user wants

  def update_score                                      # score is used to display highest matches first in carousel
    @score = ResourcesUser.all                          # any time factors are changed, update score.
    @score.each do |x|                                  # called any time a user updates their interests.
    unless x.user_has_id == nil                           # when updating, look at for update/efficiency.
       @user_has = User.find(x.user_has_id)
       @user_wants = User.find(x.user_wants_id)
       if @user_has.location == @user_wants.location    # score is weighted based on being in the same city.
        location_weight = 1
       else
        location_weight = 0.75
       end
      x.update_attribute(:score, (@user_has.interests & @user_wants.interests).length*(location_weight/@user_wants.interests.length) *100)
    end
    end
  end

  def find_matches user
    matches = []
    resource_matches = ResourcesUser.where("user_wants_id = ? or user_has_id = ?", user.id, user.id)  # grab every item that pertains to you ..
    resource_matches = resource_matches.select do |resource_match|                                    # ... and contains a mutual like ...
      resource_match.like_accept
    end

    resource_matches.each do |resource_match|
      match = {}
      if resource_match.user_has_id == user.id                # the matched user is the user who wants what you have
        match[:matched_user] = resource_match.user_wants_id
        match[:i_have] = true
        match[:resource_id] = resource_match.resource_id
      else                                                    # the matched user is the user who has what you want
        match[:matched_user] = resource_match.user_has_id
        match[:i_have] = false
        match[:resource_id] = resource_match.resource_id
      end
      match[:category] = resource_match.resource_category
      matches << match
    end
    return matches
  end

  def two_users_matched? user1, user2                  # gather the relevant data entries.
    resource_matches = (ResourcesUser.where(user_wants_id:user1.id, user_has_id:user2.id) + ResourcesUser.where(user_wants_id:user2.id, user_has_id:user1.id))
    match = true                                      # start by assuming a match exists
    match = false if resource_matches.empty?
    resource_matches.each do |resource_match|         # unless like_accept = false
      match = false unless resource_match.like_accept
    end
    return match
  end

  def find_like_requests user
    ResourcesUser.where(user_has_id:user.id, like_request:true, like_accept:false, like_reject:false)
  end

  def find_session_user
    @user = User.find session[:user_id]
  end

  def find_user_by_route
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:nickname, :name, :first_name, :last_name, :location, :email, :has_tags, :want_tags)
  end

end

