Rails.application.routes.draw do
  get 'sessions/create'
  post 'magic_link', to: 'magic_links#create'
  get 'auth', to: 'sessions#show', as: :token_login
  post 'login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
