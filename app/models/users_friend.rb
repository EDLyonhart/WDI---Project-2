# info incorporated into resources_user table.
# this model is not in use at this time

class UsersFriend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend
end
