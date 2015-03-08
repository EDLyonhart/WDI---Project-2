Rails.application.routes.draw do

# Users Routes
root 'users#login'
get '/login', to: 'users#login', as: "login"


# fb oauth
get '/auth/:provider/callback', to: 'users#create', as: "create"
get '/auth/:provider/callback', to: 'users#create_fb', as: "create_fb"

get '/users/:id', to: 'users#index', as: "user_home" #Home_page - Where user initially provieds has and wants info
get '/users/:id/show', to: 'users#show', as: "user_show" #Allows other users to see profile pages of matches
get '/users/:id/edit', to: 'users#edit', as: "user_edit" #Allows a user to edit profile page
get '/users/:id/matches', to: 'users#matches', as: "matches" #Carousel - where swiping will occur (id used to populate queue)
get '/users/:id/snippet', to: 'users#snippet', as: "snippet" #gets all Users and generates relevancy score to queue up carousel

patch '/users/:id', to: 'users#update', as: "user_update"
delete '/logout', to: 'users#logout', as: "logout"

# Resources Routes
get '/users/:id/resources', to: 'resources#index', as: "user_resources"
post '/users/:id/resources', to: 'resources#create'  #shares route name with above
get '/users/:id/resources/new', to: 'resources#new', as: "new_user_resource"
get '/users/:user_id/resource/:id', to: 'resources#show', as: "user_resource"
delete '/users/:user_id/resource/:id', to: 'resources#destroy' #shares route name with above
# need to edit a resource?

#Likes Routes
post '/user/:id/home/:likee_id', to: 'likes#check', as: "like_check"


end
