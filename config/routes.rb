Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # get 'tops/index'
  root to: 'tops#index'
  resources :incomes, only: [:new, :create]
  resources :outgos, only: [:new, :create]
end
