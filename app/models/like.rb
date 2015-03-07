class Like < ActiveRecord::Base
validates_presence_of :liker, :likee, :mutual
validates :mutual, :inclusion => {:in => [true, false]}

end
