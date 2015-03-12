class LikesController < ApplicationController
#require Mandrill - Can refactor and move to model later
require 'mandrill'
mandrill = Mandrill::API.new ENV["MANDRIL_APIKEY"]

def like
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_request, true)
  like_email
  flash.now[:alert] =  "User Liked!"
  render nothing: true
end

def accept
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_accept, true)
  render nothing: true
end

def reject_has 
@resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
@resources_user.first.update_attribute(:like_reject, true)
render nothing: true
end

def reject_wants
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_reject, true)
  render nothing: true
end

# def like_check
#   #checks to see if there isr a match
# @likee = User.find(params[:lrikee_id])
# @likee_likes = @likee.likes
#   if @likee_likes.exists?(likee: params[:id])
#     #if there is now a match - create new row in likes with boolean true; change other row's boolean to true as well
#       @like = Like.new(user_id:params[:id],likee:params[:likee_id],is_matched:true)
#       @like.save
#       Like.find_by(user_id:params[:likee_id]).update_attribute(:is_matched, true)
#       #redirect to profile page - New Match/Send out Match Email
#       flash[:alert] = "You have a match!"
#       redirect_to user_home_path (params[:id])
#       match_email
#   else
#       #if there is no match yet - add row to likes table and redirect back into the carousel
#       @like = Like.new(user_id:params[:id],likee:params[:likee_id],is_matched:false)
#       @like.save
#       #Redirect back to carousel page
#       redirect_to user_matches_path (params[:id])
#       #send like_email
#       like_email
#   end
# end

# Likes will be rejected via boolean column 'rejected'.  No need to ever delete a like.
# Saving the lwike will allow us to manage which users are shown on the carousel and
# displayed on the My Network page
def destroy
end

def update
  @user = User.find params[:id]
  @like = Like.find params[:like_id]
  @like.update_attributes(rejected:"true")
  # need some way of knowing if this like rejection is coming from my network
  # or the carousel, and redirect accordingly.
  # currently assumes the rejection is coming from my_network
  redirect_to user_network_path(@user)
end

private
#match email will no longer be necessary
# def match_email

# require 'mandrill'
# m = Mandrill::API.new
# @user1 = User.find(params[:likee_id])
# message = {
#  :subject=> "#{@user1.first_name}, you have a new match!",
#  :from_name=> "The SHAREit Team",
#  :text=>"New Match!",
#  :to=> [email:@user1.email],
#  :html=>"<html><h1> Check out your new match! <a href='http://localhost:3000/users/#{@user1.id}'>Start Sharing Now!</a> </h1></html>",
#  :from_email=>"gannavas@gmail.com"
# }
# sending = m.messages.send message
# puts sending
# end

def like_email
  require 'mandrill'
  m = Mandrill::API.new
  @user1 = User.find(params["values"]["user_has_id"])
  message = {
   :subject=> "#{@user1.first_name}, someone liked your profile!",
   :from_name=> "The SHAREit Team",
   :text=>"New Like!",
   :to=> [email:@user1.email],
   :html=>"<html><h1> Someone has liked your profile! <a href='http://localhost:3000/users/#{@user1.id}'>Start Sharing Now!</a> </h1></html>",
   :from_email=>"gannavas@gmail.com"
  }
  sending = m.messages.send message
  puts sending
end

end
