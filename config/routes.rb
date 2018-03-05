Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users/sign_out' => 'devise/sessions#destroy'
  get 'users', to: "users#index", as: "users"
  get 'users/:id', to: "users#show", as: "user"
  get 'users/:id/edit', to: "users#edit", as: "edit_user"
  patch 'users/:id', to: "users#update"




  resources :posts do
    resources :comments
  end

  root "posts#index"
  get '/about',to:'pages#about'
end
