# info incorporated into resources table.
# this model is not in use at this time

class Social < ActiveRecord::Base
   belongs_to :resource
   belongs_to :user
end
