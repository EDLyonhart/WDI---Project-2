Rails.application.routes.draw do

# Users Routes
root 'users#login'
get '/login', to: 'users#login', as: "login"


# fb oauth
get '/auth/:provider/callback', to: 'users#create', as: "create"
get '/auth/:provider/callback', to: 'users#create_fb', as: "create_fb"

get '/users/:id', to: 'users#index', as: "user_home"
get '/users/:id/matches', to: 'users#load_carousel', as: "user_matches" #Carousel - where swiping will occur (id used to populate queue)
# We need :user_id below to allow the find_reviewable method to do it's work
get '/users/:user_id/show', to: 'users#show', as: "user_show" #Allows other users to see profile pages of matches
get '/users/:user_id/profile', to: 'users#show', as: "user_profile" # publicly viewable profile
get '/users/:id/edit', to: 'users#edit', as: "user_edit" #Allows a user to edit profile page
get '/users/:id/network', to: 'users#network', as: "user_network"

# get '/users/:id/snippet', to: 'users#snippet', as: "snippet" #gets all Users and generates relevancy score to queue up carousel
# get '/carousel', to: 'users#carousel', as: "carousel" #carousel test route

patch '/users/:id', to: 'users#update', as: "user_update"
delete '/logout', to: 'users#logout', as: "logout"

# Resources
get '/users/:id/resources/newwant', to: 'resources#newwant', as: "newwant_user_resource"
post '/users/:id/resources', to: 'resources#create', as: "post_new_user_resource"
get '/users/:id/resources/newhas', to: 'resources#newhas', as: "newhas_user_resource"
post '/users/:id/resources', to: 'resrouces#create', as: "post_new_user_resource"
get '/users/:user_id/resources/:id', to: 'resources#show', as: "show_user_resource"

get '/users/:user_id/resource/:id', to: 'resources#show', as: "user_resource"
delete '/users/:user_id/resource/:id', to: 'resources#destroy' #shares route name with above
# do we need to edit a resource?

#Likes Routes
put '/users/:user_wants_id/home/:user_has_id/:resource_category', to: 'likes#like', as: "like" #action to edit like_request:boolean to true
put '/users/:user_has_id/home/:user_wants_id/:resource_category', to: 'likes#accept', as: "accept" #action to edit like_accept:boolean to true
put '/users/:user_wants_id/home/:user_has_id/:resource_category/reject_has', to: 'likes#reject_has', as: "reject_has" #action to edit like_reject:boolean to true from Wants Carousel (i.e. User swiping through useres who have what they want)
put '/users/:user_has_id/home/:user_wants_id/:resource_category/reject_wants', to: 'likes#reject_wants', as: "reject_wants"#action to edit like_reject:boolean to true from confirm Carousel (i.e. I have what user wants, and am rejecting his request to share)

patch '/users/:id/likes/:like_id', to: 'likes#update', as: "reject_user_like"

patch 'users/:id/dashboard/:like_request/accept', to: 'likes#accept_from_dashboard', as: "dashboard_like_accept"
patch 'users/:id/dashboard/:like_request/reject', to: 'likes#reject_from_dashboard', as: "dashboard_like_reject"

# Reviews
post '/users/:user_id/reviews', to: 'reviews#create_review', as: 'user_reviews'
post '/users/:some_user/resources/:resource_id/reviews' => 'reviews#create_review', as: 'user_resource_reviews'

end
