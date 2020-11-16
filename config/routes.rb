Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # get 'tops/index'
  root to: 'tops#index'
  resources :tops, only: [:show]
  resources :goals, only: [:create, :update]
  resources :incomes, only: [:new, :create, :edit, :update, :destroy]
  resources :outgos, only: [:new, :create, :edit, :update, :destroy]
end
