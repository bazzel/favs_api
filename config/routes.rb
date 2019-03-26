Rails.application.routes.draw do
  post 'sessions', to: 'sessions#create'
  get '/sign_in/:token', to: 'sessions#show', as: :token_sign_in

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
