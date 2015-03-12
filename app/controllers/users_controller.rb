class UsersController < ApplicationController

  before_action :find_session_user, only: [:index, :edit, :update, :network]
  before_action :find_user_by_route, only: [:matches]

  def index
    # @user = session user
    @resources = @user.resources
    @matches = find_matches @user # an array of objects
    # @matches.sort_by! do |match|
    #   match[:you_have] ? 1 : 0
    # end
    @like_requests = find_like_requests @user # an array of ResourcesUser objects
  
    existing_categories = []
  
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

   @avail_resources = existing_categories 
  end

  def login

  
  end

  def load_carousel
    @filter = params[:category] #make this params[:resource category] once a filter dropdown is setup
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
  end

  def edit
  end

  def create
    @resource = Resource.new
    @user = User.from_omniauth(env["omniauth.auth"], params[:provider])
    if @user.save
      session[:user_id] = @user.id
      if Resource.exists?(user_id: session[:user_id])
      redirect_to user_home_path(@user), notice: "signed in!"
      else
      redirect_to newwant_user_resource_path(@user)
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

  def interests
    @user = User.find params[:id]
  end

  def interests_add
    binding.pry
    redirect_to user_home_path(session[:user_id])
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "You are now logged out!"
  end

  private

  #
  # 'find_matches' returns an array of objects
  # Each object represents a "match," which consists of three key/value pairs:
  #   matched_user: the other guy's id (who either liked you and you accepted
  #     or you liked him and he accepted)
  #   category: the resource category (string)
  #   you_have: boolean.  If true, the match is based on you having what the other user wants
  #
  def find_matches user
    matches = []  # array of objects:
    # grab every item that pertains to you ...
    resource_matches = ResourcesUser.where("user_wants_id = ? or user_has_id = ?", user.id, user.id)
    # ... and contains a mutual like ...
    resource_matches = resource_matches.select do |resource_match|
      resource_match.like_accept
    end
    resource_matches.each do |resource_match|
      match = {}
      if resource_match.user_has_id == user.id
        # the matched user is the user who wants what you have
        match[:matched_user] = resource_match.user_wants_id
        match[:i_have] = true
      else
        # the matched user is the user who has what you want
        match[:matched_user] = resource_match.user_has_id
        match[:i_have] = false
      end
      match[:category] = resource_match.resource_category
      matches << match
    end
    return matches
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

