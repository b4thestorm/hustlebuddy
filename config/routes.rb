Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :welcome
  get '/thank_you', to: 'welcome#thank_you'
  post '/record_accountable', to: 'welcome#record_accountable'
  get 'example', to: 'welcome#example'
  
  root to: 'welcome#index'
end
