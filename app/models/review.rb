class Review < ActiveRecord::Base
  validates :content, presence: true
  
    #both resources and users can be reviewed
  belongs_to :reviewable, polymorphic: true
end
