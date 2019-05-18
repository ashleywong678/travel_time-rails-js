Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome' #homepage

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "agencies#new"   #agencies/new => sign up page
  get 'auth/google/callback', to: 'sessions#create'
  # get '/auth/facebook/callback' => 'sessions#create'

  resources :agencies, except: [:new] do
    resources :tours, only: [:index]
  end
  get '/agencies/:id/main', to: 'agencies#main', as: 'agencies_main'

  resources :tours

end

# Prefix    Verb      URI Pattern                      Controller#Action
# root      GET         /                              sessions#welcome
# login    GET          /signin(.:format)              sessions#new
#           POST        /signin(.:format)              sessions#create
# logout    GET         /logout(.:format)              sessions#destroy
#           DELETE      /logout(.:format)              sessions#destroy
# ------- agency routes ------
# signup    GET         /signup(.:format)              agenciess#new
#           POST      /signup(.:format)                agenciess#create
# agencies   GET        /agencies(.:format)            agencies#index
# edit_agency GET       /agencies/:id/edit(.:format)   agencies#edit
#agency       GET         /agencies/:id(.:format)      agencies#show
#             PATCH     /agencies/:id(.:format)        agencies#update
              # PUT    /agencies/:id(.:format)           agencies#update
              # DELETE /agencies/:id(.:format)           agencies#destroy
# ------ tours index nested under agencies ------
# agency_tours GET    /agencies/:agency_id/tours(.:format)  tours#index
# ------- tour routes --------------
# tours           GET    /tours(.:format)                tours#index
#                 POST   /tours(.:format)                tours#create
# new_tour        GET    /tours/new(.:format)            tours#new
# edit_tour       GET    /tours/:id/edit(.:format)       tours#edit
# tour            GET    /tours/:id(.:format)            tours#show
#                 PATCH  /tours/:id(.:format)            tours#update
#                 PUT    /tours/:id(.:format)            tours#update
#                 DELETE /tours/:id(.:format)            tours#destroy
