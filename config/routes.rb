Rails.application.routes.draw do
  post 'magic_link', to: 'magic_links#create'                  # Client POST to this url to get a magic link
  get 'auth',        to: 'sessions#show',     as: :token_login # Named route for composing a magic link
  post 'login',      to: 'sessions#create'
end
