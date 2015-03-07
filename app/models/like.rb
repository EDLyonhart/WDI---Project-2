class Like < ActiveRecord::Base
belongs_to :user
validates_presence_of :liker, :likee, :mutual
validates :mutual, :inclusion => {:in => [true, false]}

end
