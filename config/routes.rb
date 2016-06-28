Rails.application.routes.draw do
  root "static_pages#home"
  get "about" => "static_pages#about"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:index]
  end
  resources :relationships, only: [:create, :destroy]
  resources :courses, only: [:index, :show]
  namespace :supervisor do
    resources :users
    resources :subjects
    resources :courses do
      resources :course_subjects, only: [:show]
      resource :active_courses, only: [:update]
    end
    resources :user_courses, only: :destroy
    resources :assign_trainees, only: [:edit, :update]

  end
end
