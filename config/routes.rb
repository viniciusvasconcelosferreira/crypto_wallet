Rails.application.routes.draw do
  get 'welcome/index'
  resources :moedas
  # get '/moedas', to: 'moedas#index'
  # get '/inicio', to: 'welcome#index'
  root to: 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
