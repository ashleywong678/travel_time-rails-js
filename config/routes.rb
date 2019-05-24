Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome' #homepage
# --------- login/signup -------------
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "agencies#new"
# ------------- google omniauth ------------
  get 'auth/:provider/callback', to: 'sessions#google_auth'
# ----------- agency ----------------
  get '/agencies/:id/main', to: 'agencies#main', as: 'agencies_main'
  resources :agencies, except: [:new] do
    resources :tours, only: [:index]
  end
# ----------- tours -----------------
  resources :tours do
    resources :customers, only: [:index, :new]
  end
#---------- customers ---------
  resources :customers
#------customer_tours--------
  get '/customer_tours/:id', to: 'customer_tours#update', as: 'customer_tour'
end
