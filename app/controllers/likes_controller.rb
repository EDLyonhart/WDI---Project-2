class LikesController < ApplicationController
#require Mandrill - Can refactor and move to model later
require 'mandrill'
mandrill = Mandrill::API.new ENV["MANDRIL_APIKEY"]

def test

end

def like_check
  binding.pry
  #checks to see if there is a match
@likee = User.find(params[:likee_id])
@likee_likes = @likee.likes 
  if @likee_likes.exists?(likee: params[:id])
    #if there is now a match - create new row in likes with boolean true; change other row's boolean to true as well
      @like = Like.new(user_id:params[:id],likee:params[:likee_id],is_matched:true)
      @like.save
      Like.find_by(user_id:params[:likee_id]).update_attribute(:is_matched, true)
      #redirect to profile page - New Match/Send out Match Email
      flash[:alert] = "You have a match!"
      redirect_to user_home_path (params[:id])
      match_email
  else 
      #if there is no match yet - add row to likes table and redirect back into the carousel 
      @like = Like.new(user_id:params[:id],likee:params[:likee_id],is_matched:false)
      @like.save
      #Redirect back to carousel page
      redirect_to matches_path (params[:id])
      #send like_email
      like_email 
  end
end

private

def match_email

require 'mandrill'
m = Mandrill::API.new 
@user1 = User.find(params[:likee_id])
message = {  
 :subject=> "#{@user1.first_name}, you have a new match!",  
 :from_name=> "The SHAREit Team",  
 :text=>"New Match!",  
 :to=> [email:@user1.email],
 :html=>"<html><h1> Check out your new match! <a href='http://localhost:3000/users/#{@user1.id}'>Start Sharing Now!</a> </h1></html>",  
 :from_email=>"gannavas@gmail.com"  
}  
sending = m.messages.send message  
puts sending
end

def like_email
  
require 'mandrill'
m = Mandrill::API.new 
@user1 = User.find(params[:likee_id])
message = {  
 :subject=> "#{@user1.first_name}, you have a new match!",  
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
