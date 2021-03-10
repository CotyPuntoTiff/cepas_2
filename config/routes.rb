Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'wines', to: 'wines#create'

  root 'wines#index'
end
