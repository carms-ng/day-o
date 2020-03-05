Rails.application.routes.draw do
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard' # where the subcriped challenge go
  get '/stats', to: 'pages#stats'

  devise_for :users
  resources :users, only: [:show]
  resources :challenges, only: [:index, :show]
  resources :categories, only: [:index]

  resources :challenges, only: [] do
    resources :challenge_subscriptions, only: [:create]
  end

  # get '/challenges_all', to: 'challenges#all', as: :challenges_all

  resources :actions, only: [] do
    resources :action_completions, only: [:create]
  end

  resources :action_settings, only: [:update]
end
