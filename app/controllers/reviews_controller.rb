class ReviewsController < ApplicationController

  def create_review
    binding.pry
    unless find_reviewable.reviews.build(review_params.merge user_id: session[:user_id]).save
      flash[:notice] = "Review validation failed"
    end
    binding.pry
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def find_reviewable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
