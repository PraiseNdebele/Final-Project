Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  get "/users/search" => 'users#search'

  # complete action
  patch '/courses/:course_id/tdl/:id' => 'tdls#complete', as: :complete

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

  resources :courses, only: [] do
    resources :uploads
  end
end
