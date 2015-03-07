class UsersController < ApplicationController
  def home
    @user = User.find(session[:user_id])
  end

  def login
  end

  def signup
  end

  def create 
    user = User.from_omniauth(env["omniauth.auth"], params[:provider])
    session[:user_id] = user.id 
    redirect_to home_path, notice: "signed in!"
  end
  def logout
  session[:user_id] = nil
  redirect_to signup_path, notice: "You are now logged out!"
  end
end
