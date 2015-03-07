class UsersController < ApplicationController
  def profile
    binding.pry
    @user = User.find(session[:user_id])
  end

  def login
  end

  def snippet
  end

  def matches
  end

  def signup
  end
  
  def edit
    render :edit 
  end

  def update

  end

  def create 
    user = User.from_omniauth(env["omniauth.auth"], params[:provider])
    session[:user_id] = user.id 
    redirect_to profile_path(user.id), notice: "signed in!"
  end

  def logout
    binding.pry
  session[:user_id] = nil
  redirect_to login_path, notice: "You are now logged out!"
  end
end
