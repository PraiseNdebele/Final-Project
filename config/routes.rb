Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [] do
  	resources :courses
  end
end
