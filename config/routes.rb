Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome' #homepage

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"

  get "/signup", to: "agencies#new"   #agencies/new => sign up page

  resources :agencies, except: [:new]
  get '/agencies/:id/main', to: 'agencies#main', as: 'agencies_main'

  resources :tours

end

# Prefix    Verb      URI Pattern                      Controller#Action
# root      GET         /                              sessions#welcome
# login    GET          /signin(.:format)              sessions#new
#           POST        /signin(.:format)              sessions#create
# logout    GET         /logout(.:format)              sessions#destroy
#           DELETE      /logout(.:format)              sessions#destroy
# signup    GET         /signup(.:format)              agenciess#new
#           POST      /signup(.:format)                agenciess#create
# agencies   GET        /agencies(.:format)            agencies#index
# edit_agency GET       /agencies/:id/edit(.:format)   agencies#edit
#agency       GET         /agencies/:id(.:format)      agencies#show
#             PATCH     /agencies/:id(.:format)        agencies#update
              # PUT    /agencies/:id(.:format)           agencies#update
              # DELETE /agencies/:id(.:format)           agencies#destroy