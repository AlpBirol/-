Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  as :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :drops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'drops#index'
end
