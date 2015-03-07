class Like < ActiveRecord::Base
belongs_to :user
validates_presence_of :liker, :likee, :is_matched
validates :is_matched, :inclusion => {:in => [true, false]}

end
