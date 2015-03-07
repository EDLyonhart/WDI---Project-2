class Resource < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, as: :reviewable 

  validates_presence_of :user_id, :category, :presence
end