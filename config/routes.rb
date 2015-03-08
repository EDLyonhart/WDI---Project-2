Rails.application.routes.draw do

#Users Routes
root 'users#login'
get '/login', to: 'users#login', as: "login"
get '/user/:id/home', to: 'users#index', as: "user_home" #Home_page - Where user initially provieds has and wants info
get '/user/:id/edit', to: 'users#edit', as: "user_edit" #Allows a user to edit profile page
get '/user/:id', to: 'users#show', as: "user_show" #Allows other users to see profile pages of matches
get '/user/:id/matches', to: 'users#matches', as: "matches" #Carousel - where swiping will occur (id used to populate queue)/gets all Users and generates relevancy score to queue up carousel
get '/auth/:provider/callback', to: 'users#create', as: "create" #fb oauth
get '/auth/:provider/callback', to: 'users#create_fb', as: "create_fb" #fb oauth
put '/profile/:id/edit', to: 'users#update', as: "update"
delete '/logout', to: 'users#logout', as: "logout"

#Resources Routes
get '/profile/:id/resources', to: 'resources#index', as: "user_resources"
post '/profile/:id/resources', to: 'resources#create'
get '/profile/:id/resources/new', to: 'resources#new', as: "new_user_resource"
get '/profile/:profile_id/resource/:id', to: 'resources#show', as: "user_resource"
delete '/profile/:profile_id/resource/:id', to: 'resources#destroy'

#Likes Routes
post '/user/:id/home/:likee_id', to: 'likes#check', as: "like_check"


end
