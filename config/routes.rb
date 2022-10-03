Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'posts#index'
  get 'admins/index'

  namespace :admin do
    resources :roles
    resources :users
    root to: "roles#index"
  end

  devise_for :users
  resources :posts do
    member do
      put :reject_post
      put :approve_post
    end
  end
  resources :users

  get '/about', to: "posts#about" 
  get '/contact', to: "posts#contact"
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  
end
