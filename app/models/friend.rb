# Origionally created for use in FB social graph.
# save for full production.
# this model is not in use at this time

class Friend < ActiveRecord::Base
  has_many :users_friends
  has_many :users, through: :users_friends
  
  validates :is_user, :inclusion => {:in => [true, false]}
end


