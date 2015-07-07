Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :users, only: [] do
  	resources :courses
  end

  resources :courses, only: [] do
  	resources :tdls
  end

  resources :courses, only: [] do
    resources :importants
  end

  resources :courses, only: [] do
    resources :goals
  end
end
