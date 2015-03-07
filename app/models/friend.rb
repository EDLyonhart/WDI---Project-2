class Friend < ActiveRecord::Base
  has_many :users_friends
  has_many :users, through: :users_friends
  
  validates :is_user, :inclusion => {:in => [true, false]}
end


