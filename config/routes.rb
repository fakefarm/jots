Rails.application.routes.draw do

  devise_for :users
  root 'entries#index'

  get '/jots' => 'entries#index'

  resources :entries

end
