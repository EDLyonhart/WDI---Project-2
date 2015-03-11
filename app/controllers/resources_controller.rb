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
    binding.pry
    # don't allow user to save identical resources
    unless resource_exists @user, @resource
      if @resource.save
        # update_user_table @user, @resource, "add"
        # below will update category booleans in users table
        if resource_params[:has] == "1"
          binding.pry
        @user.update_attribute(has_category.to_sym, true)
        else 
          binding.pry
        @has_resource.each do |user|  
        ResourcesUser.create(user_id:@user.id,has_user_id: user.id, score: 1, resource_category: resource_params[:category])
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
          binding.pry
        @user.update_attribute(has_category.to_sym, false)
        else 
          binding.pry
        @user.update_attribute(wants_category.to_sym, false)
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

#commenting out def update_user_table - as this should no longer be necessary and should be replaced with boolean logic
  # def update_user_table user, resource, add_or_remove
  #   # add the resource to user.has_tags[] or user.want_tags[] as appropriate
  #   @user = user
  #   if add_or_remove == "add"
  #     if resource.has
  #       @user.has_tags << resource.category
  #       @user.save
  #     else
  #       @user.want_tags << resource.category
  #       @user.save
  #     end
  #   elsif add_or_remove == "remove"
  #     if resource.has
  #       @user.has_tags.delete resource.category
  #       @user.save
  #     else
  #       @user.want_tags.delete resource.category
  #       @user.save
  #     end
  #   else
  #     flash[:alert] = "Something bad happened when updating user table"
  #   end
  # end

  def find_user
    @user = User.find session[:user_id]
  end

  def resource_params
    params.require(:resource).permit(:user_id, :category, :has)
  end

end
