class Review < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :reviewable, polymorphic: true
end
