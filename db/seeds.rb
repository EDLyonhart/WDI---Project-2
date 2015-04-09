# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Resource.destroy_all

User.create(nickname: 'Blossom', email: 'amy.lewis@email.com', name: 'Amy Lewis', first_name: 'Amy', last_name: 'Lewis', profile_pic: 'https://www.utc.edu/health-human-performance/images/profiles/melissa-powell.jpg', location: 'Los Angeles, CA', gender: 'F', uid: 1, has_tags: ['vehicle, bike'], want_tags: ['housing, pet, social'] )
User.create(nickname: 'CareBear', email: 'jenny.kim@email.com', name: 'Jenny Kim', first_name: 'Jenny', last_name: 'Kim', profile_pic: 'https://www.utc.edu/health-human-performance/images/profiles/melissa-powell.jpg', location: 'Los Angeles, CA', gender: 'F', uid: 2, has_tags: ['vehicle, social'], want_tags: ['pet, housing, bike'] )
User.create(nickname: 'Jetson', email: 'michael.vallejo@email.com', name: 'Michael Vallejo', first_name: 'Michael', last_name: 'Vallejo', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid: 3, has_tags: ['bike, housing'], want_tags: ['pet, vehicle, social'] )
User.create(nickname: 'Scooby', email: 'sam.min@email.com', name: 'Sam Min', first_name: 'Sam', last_name: 'Min', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid: 4, has_tags: ['vehicle, bike'], want_tags: ['housing, pet, social'] )
User.create(nickname: 'Candyman', email: 'eugene.choi@email.com', name: 'Eugene Choi', first_name: 'Eugene', last_name: 'Choi', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid: 5, has_tags: ['vehicle, housing'], want_tags: ['bike, pet, social'] )
User.create(nickname: 'The Duke', email: 'george.sasscer@gmail.com', name: 'George Sasscer', first_name: 'George', last_name: 'Sasscer', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid: 6, has_tags: ['vehicle, pet'], want_tags: ['bike, housing, social'] )
User.create(nickname: 'The Duchess', email: 'Jackie Sasscer', name: 'Jackie Sasscer', first_name: 'Jackie', last_name: 'Sasscer', profile_pic: 'https://www.utc.edu/health-human-performance/images/profiles/melissa-powell.jpg', location: 'Los Angeles, CA', gender: 'F', uid: 7, has_tags: ['pet, vehicle'], want_tags: ['bike, housing, social'] )
User.create(nickname: 'Ghostbuster', email: 'bill.oreilly@email.com', name: 'Bill O\'Reilly', first_name: 'Bill', last_name: 'O\'Reilly', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid: 8, has_tags: ['housing, social'], want_tags: ['vehicle, bike, pet'] )
User.create(nickname: 'Han Solo', email: 'doug.funny@email.com', name: 'Doug Funny', first_name: 'Doug', last_name: 'Funny', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid: 9, has_tags: ['housing'], want_tags: ['bike, vehicle, pet, social'] )
User.create(nickname: 'Taco', email: 'lionel.ritchie@email.com', name: 'Lionel Ritchie', first_name: 'Lionel', last_name: 'Ritchie', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'Los Angeles, CA', gender: 'M', uid:10, has_tags: ['vehicle, social'], want_tags: ['bike, housing, pet'] )
User.create(nickname: 'Princess Leia', email: 'erin.huie@gmail.com', name: 'Erin Huie', first_name: 'Erin', last_name: 'Huie', profile_pic: 'https://www.utc.edu/health-human-performance/images/profiles/melissa-powell.jpg', location: 'San Francisco, CA', gender: 'F', uid:11, has_tags: ['social'], want_tags: ['vehicle, bike, housing, pet'] )
User.create(nickname: 'Foo', email: 'eugene.choi@email.com', name: 'Eugene Choi', first_name: 'Eugene', last_name: 'Choi', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'San Francisco, CA', gender: 'M', uid: 12, has_tags: ['bike, vehicle'], want_tags: ['housing, pet, social'] )
User.create(nickname: 'Mario', email: 'ken.burns@email.com', name: 'Ken Burns', first_name: 'Ken', last_name: 'Burns', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'San Francisco, CA', gender: 'M', uid: 13, has_tags: ['vehicle, social'], want_tags: ['bike, housing, pet'] )
User.create(nickname: 'Luigi', email: 'kevin.hart@gmail.com', name: 'Kevin Hart', first_name: 'Kevin', last_name: 'Hart', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'San Francisco, CA', gender: 'M', uid: 14, has_tags: ['social, bike'], want_tags: ['housing, vehicle, pet'] )
User.create(nickname: 'Captain Kirk', email: 'james.t.kirk@gmail.com', name: 'James T. Kirk', first_name: 'James', last_name: 'Kirk', profile_pic: 'https://assets.bellmedia.ca.s3.amazonaws.com/uploads/2014/06/Scott-Henderson_1_2013-200x200.jpg', location: 'San Francisco, CA', gender: 'M', uid: 15, has_tags: ['social, pet'], want_tags: ['bike, vehicle, housing'] )

Resource.create(user_id: 1, category: "vehicle", has: true)
Resource.create(user_id: 1, category: "bike", has: true)
Resource.create(user_id: 2, category: "vehicle", has: true)
Resource.create(user_id: 2, category: "social", has: true)
Resource.create(user_id: 3, category: "bike", has: true)
Resource.create(user_id: 3, category: "housing", has: true)
Resource.create(user_id: 4, category: "vehicle", has: true)
Resource.create(user_id: 4, category: "bike", has: true)
Resource.create(user_id: 5, category: "vehicle", has: true)
Resource.create(user_id: 5, category: "housing", has: true)
Resource.create(user_id: 6, category: "vehicle", has: true)
Resource.create(user_id: 6, category: "pet", has: true)
Resource.create(user_id: 7, category: "vehicle", has: true)
Resource.create(user_id: 7, category: "pet", has: true)
Resource.create(user_id: 8, category: "social", has: true)
Resource.create(user_id: 8, category: "housing", has: true)
Resource.create(user_id: 9, category: "housing", has: true)
Resource.create(user_id: 10, category: "vehicle", has: true)
Resource.create(user_id: 10, category: "social", has: true)
Resource.create(user_id: 11, category: "social", has: true)
Resource.create(user_id: 12, category: "vehicle", has: true)
Resource.create(user_id: 12, category: "bike", has: true)
Resource.create(user_id: 13, category: "vehicle", has: true)
Resource.create(user_id: 13, category: "social", has: true)
Resource.create(user_id: 14, category: "bike", has: true)
Resource.create(user_id: 14, category: "social", has: true)
Resource.create(user_id: 15, category: "pet", has: true)
Resource.create(user_id: 15, category: "social", has: true)









