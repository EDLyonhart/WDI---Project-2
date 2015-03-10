Rails.application.routes.draw do

# Users Routes
root 'users#login'
get '/login', to: 'users#login', as: "login"


# fb oauth
get '/auth/:provider/callback', to: 'users#create', as: "create"
get '/auth/:provider/callback', to: 'users#create_fb', as: "create_fb"

get '/users/:id', to: 'users#index', as: "user_home"
get '/users/:id/matches', to: 'users#matches', as: "user_matches" #Carousel - where swiping will occur (id used to populate queue)
get '/users/:id/profile', to: 'users#profile', as: "user_profile" # publicly viewable profile
# We need :user_id below to allow the find_reviewable method to do it's work
get '/users/:user_id/show', to: 'users#show', as: "user_show" #Allows other users to see profile pages of matches
get '/users/:id/edit', to: 'users#edit', as: "user_edit" #Allows a user to edit profile page
get '/users/:id/network', to: 'users#network', as: "user_network"

get '/users/:id/snippet', to: 'users#snippet', as: "snippet" #gets all Users and generates relevancy score to queue up carousel
get '/carousel', to: 'users#carousel', as: "carousel" #carousel test route

patch '/users/:id', to: 'users#update', as: "user_update"
delete '/logout', to: 'users#logout', as: "logout"

# Resources
get '/users/:id/resources/new', to: 'resources#new', as: "new_user_resource"
post '/users/:id/resources', to: 'resources#create', as: "post_new_user_resource"

get '/users/:user_id/resource/:id', to: 'resources#show', as: "user_resource"
delete '/users/:user_id/resource/:id', to: 'resources#destroy' #shares route name with above
# do we need to edit a resource?

#Likes Routes
# get '/users/:id/home/:likee_id', to: 'likes#test', as: "test"
post '/users/:id/home/:likee_id', to: 'likes#like_check', as: "like_check"
delete '/users/:id/home/:likee_id', to: 'likes#destroy', as: "delete_like"
# Reviews
post '/users/:user_id/reviews', to: 'reviews#create_review', as: 'user_reviews'
post '/users/:some_user/resources/:resource_id/reviews' => 'reviews#create_review', as: 'user_resource_reviews'

end
