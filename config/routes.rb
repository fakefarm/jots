Rails.application.routes.draw do

  devise_for :users
  root 'today#index'

  get '/welcome' => 'static#index'

  resources :entries
  resources :today, only: :index
  resources :tags
  resources :searches, only: [:index, :show]
  resources :archives, only: [:index, :show]
end
