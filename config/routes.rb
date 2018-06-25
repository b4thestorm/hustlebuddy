Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :welcome
  get '/thank_you', to: 'welcome#thank_you'

  root to: 'welcome#index'
end
