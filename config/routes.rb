Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # get 'tops/index'
  root to: 'tops#index'
  resources :tops, only: [:show]
  resources :goals, only: [:create, :update]
  resources :incomes, only: [:new, :create, :edit, :update, :destroy]
  resources :outgos, only: [:new, :create, :edit, :update, :destroy]
end
