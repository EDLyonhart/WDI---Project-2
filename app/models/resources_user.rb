class ResourcesUser < ActiveRecord::Base
  belongs_to :owning_user, class_name: "User", foreign_key: "user_has_id"
  belongs_to :wanting_user, class_name: "User", foreign_key: "user_wants_id"

  def self.wanted_by_and_categorized_by(user_id, category)
    wanted_by(user_id).categorized_by(category)
  end

  def self.wanted_by user_id 
    where(user_wants_id: user_id)
  end
  
  def self.categorized_by category
    where(resource_category: category)
  end

  def self.not_liked
    where(like_request: false)
  end
end