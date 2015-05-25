Rails.application.routes.draw do
	get '/sitemap.xml.gz' => 'sitemaps#show'
  devise_for :users
  resources :missions, only: [:show, :new, :create, :edit, :update]
  resources :providers, only: [:show, :new, :create, :edit, :update] do
  	get 'completed', on: :member
  end
  root 'providers#show', id: 'spacex'
end
