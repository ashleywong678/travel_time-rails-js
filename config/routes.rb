Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'sessions#welcome'
  resources :sessions, only: [:new, :create]

end

# Prefix        Verb    URI Pattern                         Controller#Action
# root          GET     /                                   sessions#welcome
# sessions      POST    /sessions(.:format)                 sessions#create
# new_session   GET     /sessions/new(.:format)             sessions#new