Rails.application.routes.draw do

  root 'entries#index'

  get '/jots' => 'entries#index'

  resources :entries

end
