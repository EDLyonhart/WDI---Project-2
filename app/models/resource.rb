class Resource < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :catagory, :presence
  validates :presence, :inclusion => {:in => [true, false]}
end