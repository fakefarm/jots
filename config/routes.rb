Rails.application.routes.draw do

  devise_for :users
  root 'entries#index'

  resources :entries, except: :show
  resources :searches, only: [:index]
  resources :archives, only: [:index, :show]
end
