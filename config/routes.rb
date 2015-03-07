Rails.application.routes.draw do
  #Users Routes
  root 'users#login'
  get '/login', to: 'users#login', as: "login"
  get '/profile/:id', to: 'users#profile', as: "profile" #Home_page = where swiping will occur (id used to populate queue)
  get '/profile/:id/snippet', to: 'users#snippet', as: "snippet" #sample profile page of user to be displayed in carousel 
  get '/profile/:id/edit', to: 'users#edit', as: "edit_profile"
  get '/profile/:id/matches', to: 'users#matches', as: "matches" #List Users Matches
  get '/auth/:provider/callback', to: 'users#create', as: "create" #fb oauth
  get '/auth/:provider/callback', to: 'users#create_fb', as: "create_fb" #fb oauth
  put '/profile/:id/edit', to: 'users#update', as: "update"
  delete '/logout', to: 'users#logout', as: "logout"

#Resources Routes
resources :resources
end
