Rails.application.routes.draw do
  get 'task_completions/create'
  get 'challenge_subscriptions/create'
  get 'challenges/index'
  get 'categories/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
