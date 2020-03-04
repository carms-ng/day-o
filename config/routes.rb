Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :users, only: [:show]
  resources :categories, only: [:index] do
    resources :challenges, only: [:index]
  end

  resources :challenges, only: [] do
    resources :challenge_subscriptions, only: [:create]
  end
  get '/challenges_all', to: 'challenges#all', as: :challenges_all

  resources :users, only: [:show]
  get '/dashboard', to: 'pages#dashboard'

  resources :actions, only: [] do
    resources :action_completions, only: [:create]
  end

end
