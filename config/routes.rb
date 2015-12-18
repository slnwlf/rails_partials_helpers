Rails.application.routes.draw do

  root "recipes#index"
  resources :recipes
  resources :users, except: [:new]

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  resources :sessions, only: [:create]

end


#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           recipes#index
#     recipes GET    /recipes(.:format)          recipes#index
#             POST   /recipes(.:format)          recipes#create
#  new_recipe GET    /recipes/new(.:format)      recipes#new
# edit_recipe GET    /recipes/:id/edit(.:format) recipes#edit
#      recipe GET    /recipes/:id(.:format)      recipes#show
#             PATCH  /recipes/:id(.:format)      recipes#update
#             PUT    /recipes/:id(.:format)      recipes#update
#             DELETE /recipes/:id(.:format)      recipes#destroy
#       users GET    /users(.:format)            users#index
#             POST   /users(.:format)            users#create
#   edit_user GET    /users/:id/edit(.:format)   users#edit
#        user GET    /users/:id(.:format)        users#show
#             PATCH  /users/:id(.:format)        users#update
#             PUT    /users/:id(.:format)        users#update
#             DELETE /users/:id(.:format)        users#destroy
#      signup GET    /signup(.:format)           users#new
#       login GET    /login(.:format)            sessions#new
#      logout GET    /logout(.:format)           sessions#destroy
#    sessions POST   /sessions(.:format)         sessions#create