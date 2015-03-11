class Resource < ActiveRecord::Base
  has_many :resources_users
  has_many :users, through: :resources_users
  has_many :reviews, as: :reviewable 

  validates_presence_of :user_id, :category, :presence
end