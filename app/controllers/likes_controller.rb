class LikesController < ApplicationController

def like_check
  #checks to see if there is a match
@likee = User.find(params[:likee_id])
@likee_likes = @likee.likes 
  if @likee_likes.exists(likee: params[:id])
    #if there is now a match - create new row in likes with boolean true; change other row's boolean to true as well
      @like = Likes.new(user_id:params[:id],likee:params[:likee_id],is_matched:true)
      Like.find_by(user_id:params[:likee_id]).update_attribute(is_matched:true)
      #redirect to profile page - New Like
      redirect_to user_home_path (params[:id])
  else 
      #if there is no match yet - add row to likes table and redirect back into the carousel 
      @like = Likes.new(user_id:params[:id],likee:params[:likee_id],is_matched:false)
      #Redirect back to carousel page
      redirect_to matches_path (params[:id])
  end
end
end
