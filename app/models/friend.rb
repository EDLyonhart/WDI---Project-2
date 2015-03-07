class Friend < ActiveRecord::Base
  has_many :users_friends
  has_many :users, through: :users_friends
end
