Rails.application.routes.draw do

  devise_for :users
  root 'entries#index'

  resources :entries
  resources :searches, only: [:index, :show]
  resources :archives, only: [:index, :show]
end
