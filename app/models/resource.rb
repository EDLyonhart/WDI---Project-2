class Resource < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :catagory
  validates :presence, :inclusiuon => {:in => [true, false]}
end