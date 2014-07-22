Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :results
  resources :questions do
    resources :answers
  end

  # match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  # match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  # get '/auth/:provider/callback', to: 'devise/sessions#create'
  root 'questions#index'
end
