Rails.application.routes.draw do
  devise_for :users
  resources :missions do
  	get 'completed', on: :collection
  end
  root 'missions#index'
end
