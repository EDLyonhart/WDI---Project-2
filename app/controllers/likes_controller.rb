class LikesController < ApplicationController
#require Mandrill - Can refactor and move to model later
require 'mandrill'
mandrill = Mandrill::API.new ENV["MANDRIL_APIKEY"]

def like                                    # if user liked, acknowledge it.
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_request, true)
  # like_email
  flash.now[:alert] =  "User Liked!"
  render nothing: true
end

def accept                                  # if 'like' is accepted update resources_user table.
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_accept, true)
  render nothing: true
end

def reject_has                              # if 'like' is rejected update resources_user table && carousel (from likes.js).
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_reject, true)
  render nothing: true
end

def reject_wants                            # if 'like' is rejected update resources_user table && carousel (from likes.js).
  @resources_user = ResourcesUser.where(user_wants_id: params["values"]["user_wants_id"],user_has_id: params["values"]["user_has_id"],resource_category:params["values"]["resource_category"] )
  @resources_user.first.update_attribute(:like_reject, true)
  render nothing: true
end

def email
  @send_to_email = params[:user][:email]
  @sent_from_email = User.find(params[:from]).email
  # @sent_from_email = "liescott@gmail.com"
  @message = params[:user][:first_name]
  @user1 = User.find(session[:user_id])
  require 'mandrill'
    m = Mandrill::API.new
    message = {                                                       # this is the function which sends an email from within the app.
     :subject=> "Request to share from, #{@user1.first_name}!",
     :from_name=> "The SHAREit Team",
     :text=>"Sharing is caring!",
     :to=> [email:@send_to_email],
     :html=>"<html><h1>#{@message}<a href='https://coolest-tinder-for-sharing-app.herokuapp.com/users/#{params[:send_to]}/show'> See #{@user1.first_name}'s profile!</a> </h1></html>",
     :from_email=>@sent_from_email
    }
    sending = m.messages.send message
    puts sending

  flash[:alert] =  "Message Sent!"
  redirect_to user_show_path (params[:send_to])
end

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
# def like_email                          # not currently in use. could be implemented to inform users that they have been 'liked'
#   require 'mandrill'
#   m = Mandrill::API.new
#   @user1 = User.find(params["values"]["user_has_id"])
#   message = {
#    :subject=> "#{@user1.first_name}, someone liked your profile!",
#    :from_name=> "The SHAREit Team",
#    :text=>"New Like!",
#    :to=> [email:@user1.email],
#    :html=>"<html><h1> Someone has liked your profile! <a href='https://localhost:3000/users/#{@user1.id}'>Start Sharing Now!</a> </h1></html>",
#    :from_email=>"gannavas@gmail.com"
#   }
#   sending = m.messages.send message
#   puts sending
# end

end
