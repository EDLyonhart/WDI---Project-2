class User < ActiveRecord::Base
  def self.from_omniauth(auth, provider) 
    where(uid: auth[:uid], name: auth[:info][:nickname]).first || create_from_omniauth(auth,provider)
  end
    
  def self.create_from_omniauth(auth,provider)

  create(uid: auth["uid"],nickname: auth["info"]["nickname"],email: auth["info"]["email"],  
    name: auth["info"]["name"],first_name: auth["info"]["first_name"],last_name: auth["info"]["last_name"],
    profile_pic: auth["info"]["image"], location: auth["info"]["location"], gender: auth["extra"]["gender"]  )
  end
end
