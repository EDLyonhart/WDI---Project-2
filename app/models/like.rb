# info incorporated into resources_user model.
# this model is not in use at this time

class Like < ActiveRecord::Base
belongs_to :user

validates_presence_of :user_id, :likee

validates :is_matched, :inclusion => { :in => [true, false] }

end
