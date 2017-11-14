Rails.application.routes.draw do
  resources :tries
  resources :frames
  resources :games
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => ""
end
