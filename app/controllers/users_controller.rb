class UsersController < ApplicationController
  def profile
    @user = User.find(session[:user_id])
  end

  def login
    if session[:user_id] != nil
      redirect_to profile_path(session[:user_id])
    else
    end  
  end

  def snippet
  @user = User.find(params[:id])
  @likes = @user.likes
  user_array = []
  user_array << @user 
  @users = User.all - user_array - @likes
  @users = @users.each {|user| user[:score] = (@user[:has_tags] & user[:want_tags]).length + (@user[:want_tags] & user[:has_tags]).length}
  @users = @users.sort_by {|user| user[:score]}.reverse
  end

  def matches
  @user = user.find(params[:id])
  @likes = @user.likes
  @matches = @likes.where(is_matched:true)
  end

  def edit
     @user = User.find(session[:user_id])
  end

  def create 
    @user = User.from_omniauth(env["omniauth.auth"], params[:provider])
    if @user.save
    session[:user_id] = @user.id 
    redirect_to profile_path(@user.id), notice: "signed in!"
    else
    redirect_to login_path, notice: "sign in Error!"
    end
  end

  def update
     @user = User.find(session[:user_id])

  end

  def logout
  session[:user_id] = nil
  redirect_to login_path, notice: "You are now logged out!"
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:name,:location, :has_tags, :want_tags)
  end  
end







