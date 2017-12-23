Rails.application.routes.draw do
  resources :door_access
  resources :card_groups
  resources :access_logs
  resources :doors
  resources :cards
  resources :access_groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
