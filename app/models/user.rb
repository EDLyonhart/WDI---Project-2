class User < ActiveRecord::Base
  has_many :users_friends
  has_many :friends, through: :users_friends
  has_many :resources
  has_many :likes
  has_many :reviews, as: :reviewable

  validates_presence_of :uid, :email, :name

  def self.from_omniauth(auth, provider)
    find_by(uid: auth[:uid]) || create_from_omniauth(auth,provider)
  end

  def self.create_from_omniauth(auth,provider)
  new(uid: auth["uid"],nickname: auth["info"]["nickname"],email: auth["info"]["email"],
    name: auth["info"]["name"],first_name: auth["info"]["first_name"],last_name: auth["info"]["last_name"],
    profile_pic: auth["info"]["image"], location: auth["info"]["location"], gender: auth["extra"]["gender"]  )
  end
end
