class ResourcesController < ApplicationController

  before_action :find_user, only: [:index, :new, :create, :update_user_table]

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
    # don't allow user to save identical resources
    unless resource_exists @user, @resource
      if @resource.save
        update_user_table @user, @resource
        redirect_to user_resources_path @user
      else
        flash.now[:alert] = "Please correct the following input errors"
        render :new
      end
    else
      flash.now[:alert] = "You have already created that resource"
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

  def resource_exists user, new_resource
    unless user.resources.empty?
      user.resources.each do |resource|
        if resource.category == new_resource.category && resource.has == new_resource.has
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def update_user_table user, resource
    # add the resource to user.has_tags[] or user.want_tags[] as appropriate
    @user = user
    if resource.has
      @user.has_tags << resource.category
      @user.save
    else
      @user.want_tags << resource.category
      @user.save
    end
  end

  def find_user
    @user = User.find session[:user_id]
  end

  def resource_params
    params.require(:resource).permit(:user_id, :category, :has)
  end

end
