Rails.application.routes.draw do

  root to: 'dashboard#home'
  resources :customer, except: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
