Rails.application.routes.draw do

  root to: 'welcome#index'

  devise_for :users
  resources :users, only: [] do
  	resources :courses
  end
end
