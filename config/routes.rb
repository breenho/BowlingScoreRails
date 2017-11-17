Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :frames
  resources :tries

  root :to => "tries#index"
end
