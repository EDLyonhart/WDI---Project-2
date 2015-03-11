class UsersController < ApplicationController

  before_action :find_session_user, only: [:index, :edit, :update, :network]
  before_action :find_user_by_route, only: [:matches]
  before_action :find_user_likes, only: [:index, :matches, :network]

  def carousel
    match_list
  end

  before_action :find_user_likes, only: [:index]

  def index
    @resources = @user.resources
    @matches = @likes.where(is_matched:true)
  end

  def login
    if session[:user_id] != nil
      redirect_to user_matches_path(session[:user_id])
    end
  end

  def matches
    # adds session user into an array for subsequent processing
    user_array = []
    user_array << @user
    # put session user's likes into an array for subsequent processing
    @likes = likes_to_users @user.likes
    # create a list of potential matches (@users) by starting with User.all
    # and subtracting session user and any other user who session user has already liked
    @carousel_users = User.all - user_array - @likes
    @carousel_users = @carousel_users.each do |user|
      # each user in the carousel ranked in terms of mutual interests with the session user
      user[:score] =
        (@user[:has_tags] & user[:want_tags]).length +
        (@user[:want_tags] & user[:has_tags]).length
    end
    @carousel_users = @carousel_users.sort_by do |user|
      user[:score]
    end
    @carousel_users.reverse!
  end

  # @matches and @like_me are both arrays of Like models
  def network
    @matches = find_user_likes.select do |like|
      like.is_matched
    end
    @like_me = []
    User.all.each do |user|
      user.likes.each do |like|
        # @user is me
        if like.likee == @user.id && !like.is_matched && !like.rejected
          @like_me << like
        end
      end
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
    @user = User.from_omniauth(env["omniauth.auth"], params[:provider])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_home_path(@user), notice: "signed in!"
    else
      flash[:alert] = "Login Error"
      redirect_to login_path
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

  def logout
    session[:user_id] = nil
    redirect_to login_path, notice: "You are now logged out!"
  end

  private

  # This method takes an array of Like models and translates it
  # into an array of User models
  def likes_to_users likes
    users = []
    likes.each do |like|
      users << (User.find like.likee)
    end
    return users
  end

  def find_session_user
    @user = User.find session[:user_id]
  end

  def find_user_by_route
    @user = User.find params[:id]
  end

  def find_user_likes
    @likes = @user.likes
  end

  def user_params
    params.require(:user).permit(:nickname, :name, :first_name, :last_name, :location, :email, :has_tags, :want_tags)
  end

  def match_list
    # adds session user into an array for subsequent processing
    @user = User.find session[:user_id]
    user_array = []
    user_array << @user
    # put session user's likes into an array for subsequent processing
    @likes = likes_to_users @user.likes
    # create a list of potential matches (@users) by starting with User.all
    # and subtracting session user and any other user who session user has already liked
    @carousel_users = User.all - user_array - @likes
    @carousel_users = @carousel_users.each do |user|
      # each user in the carousel ranked in terms of mutual interests with the session user
      user[:score] =
        (@user[:has_tags] & user[:want_tags]).length +
        (@user[:want_tags] & user[:has_tags]).length
    end
    @carousel_users = @carousel_users.sort_by do |user|
      user[:score]
    end
    @carousel_users.reverse!
    @match_list = @carousel_users - [@carousel_users[0]]
  end
end







