class ResourcesController < ApplicationController

  before_action :find_user, only: [:index, :new, :create, :destroy, :update_user_table]

  def index
    @resources = @user.resources
  end

  def new
    @resource = Resource.new
  end

  def show
    @user = User.find params[:user_id]
    @resource = Resource.find params[:id]
  end

  def create
    has_category = "has_#{resource_params[:category]}"
    wants_category = "wants_#{resource_params[:category]}"
    @resource = Resource.new resource_params
    @has_resource = User.where(has_category.to_sym => true) - [@user]
    @wants_resource = User.where(wants_category.to_sym => true) - [@user]
    # don't allow user to save identical resources
    unless resource_exists @user, @resource
      if @resource.save
        # update_user_table @user, @resource, "add"
        # below will update category booleans in users table
        if resource_params[:has] == "true"
        #creating joint table row + scoring interest overlap
        @wants_resource.each do |user|
        if user.location == @user.location
          location_weight = 1
        else
          location_weight = 0.75
        #end of scoring algo
        end
        ResourcesUser.create(user_wants_id:user.id,user_has_id: @user.id,
          score: (user.interests & @user.interests).length*location_weight, resource_category: resource_params[:category])
        end
        @user.update_attribute(has_category.to_sym, true)
        else
        #creating joint table row + scoring interest overlap
        @has_resource.each do |user|
        if @user.location == user.location
          location_weight = 1
        else
          location_weight = 0.75
        #end of scoring algo
        end
        ResourcesUser.create(user_has_id:user.id,user_wants_id: @user.id,
          score: (@user.interests & user.interests).length*location_weight, resource_category: resource_params[:category])
        end
        @user.update_attribute(wants_category.to_sym, true)
        end
        #end of updating category booleans in users table
        redirect_to user_home_path @user
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
    resource = Resource.find params[:id] # No need for instance var here
    # is this check even going to be necessary?
    # when will one user be able to directly examine another user's resources?
    has_category = "has_#{resource.category}"
    wants_category = "wants_#{resource.category}"
    if session[:user_id] != resource.user_id
      flash[:alert] = "You are not authorized to delete this itinerary"
      redirect_to user_home_path
    else
      # below will update category booleans in users table
       if resource.has
        @user.update_attribute(has_category.to_sym, false)
        #deleting joint table entries when a has is removed
        @resourceusers = ResourcesUser.where(resource_category: resource.category).where(has_user_id: @user.id)
        @resourceusers.destroy_all
        else
        @user.update_attribute(wants_category.to_sym, false)
        #deleting joint table entries when a want is removed
        @resourceusers = ResourcesUser.where(resource_category: resource.category).where(user_id: @user.id)
        @resourceusers.destroy_all
       end
        #end of updating category booleans in users table
      # update_user_table @user, resource, "remove"
      resource.destroy
      redirect_to user_home_path
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

  def find_user
    @user = User.find session[:user_id]
  end

  def resource_params
    params.require(:resource).permit(:user_id, :category, :has)
  end

end
