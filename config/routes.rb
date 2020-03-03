Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :categories, only: [:index] do
    resources :challenges, only: [:index]
  end

  resources :challenges, only: [] do
    resources :challenge_subscriptions, only: [:create]
  end

  resources :users, only: [:show]
  get '/dashboard', to: 'pages#dashboard'

  resources :tasks, only: [] do
    resources :task_completions, only: [:create]
  end

end
