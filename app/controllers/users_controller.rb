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
  @user = user.find(params[:id])
  end
  def matches
  @user = user.find(params[:id])
  @matches = @user.likes
  end

  def signup
  end

  def edit
    render :edit
  end

  def update

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

  def logout
  session[:user_id] = nil
  redirect_to login_path, notice: "You are now logged out!"
  end
end
