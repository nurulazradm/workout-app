Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'dashboard#index'
  get 'dashboard/search', to: 'dashboard#search'
  post 'dashboard/search', to: 'dashboard#search'

  resources :users do
    resources :exercises
  end
end
