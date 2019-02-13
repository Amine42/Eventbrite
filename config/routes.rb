Rails.application.routes.draw do
  root to: "events#index"
  get 'home/index'
  get 'home/secret'
  get 'events/create'
 
  devise_for :users
  resources :events do
    resources :attendances
  end
  resources :users
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
