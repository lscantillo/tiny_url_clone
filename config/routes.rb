Rails.application.routes.draw do
  root "home#index"
  resources :urls, only: [:show]
  post 'create', to: 'home#create'
  get 'show', to: 'home#show'
  get ':token' , to: 'urls#redirect', as: 'domain'
  get ':token/redirect' , to: 'urls#go_to_redirect', as: 'redirect'
  get ':token/info', to: 'urls#info'

end
