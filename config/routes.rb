# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: "dashboard#index"

  resources :access_groups
  resources :access_logs

  resources :cards
  post 'cards/captured', to: 'cards#captured'

  resources :doors
  #resources :card_groups
  #resources :door_access
end
