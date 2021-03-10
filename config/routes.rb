Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :oenologists, only:[:new, :create]
  post 'wines', to: 'wines#create'

  root 'wines#index'
end
