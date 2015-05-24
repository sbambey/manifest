Rails.application.routes.draw do
  devise_for :users
  resources :missions, only: [:new, :create, :edit, :update]
  resources :providers, only: [:show, :new, :create, :edit, :update] do
  	get 'completed', on: :member
  end
  root 'providers#show', id: 'spacex'
end
