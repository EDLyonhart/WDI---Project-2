class ResourcesController < ApplicationController

  before_action :find_user, only: [:index, :new, :create]

  def index
    @resources = User.find(session[:user_id]).resources
  end

  def show
    @user = User.find params[:profile_id]
    @resource = Resource.find params[:id]
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new resource_params
    if @resource.save
      @user.resources << @resource
      redirect_to user_resources_path(@user)
    else
      flash.now[:alert] = "Please correct the following input errors"
      render :new
    end
  end

  def destroy
    resource = Resource.find params[:id] # No need for instance var here #
    if session[:user_id] != resource.user_id
      flash[:alert] = "You are not authorized to delete this itinerary"
      redirect_to user_resources_path
    else
      resource.destroy
      redirect_to user_resources_path
    end
  end

  private

  def find_user
    @user = User.find session[:user_id]
  end

  def resource_params
    params.require(:resource).permit(:user_id, :category, :has)
  end

end
