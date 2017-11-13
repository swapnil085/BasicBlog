Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

resources :sessions, only: [:create, :destroy]
resource :home, only: [:show]
  devise_for :users
  resources :posts do
    resources :comments
  end

  root "posts#index"
  get '/about',to:'pages#about'
end
