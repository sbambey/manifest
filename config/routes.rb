Rails.application.routes.draw do
	get '/sitemap.xml.gz' => 'sitemaps#show'
  devise_for :users, skip: [:registrations]
  as :user do
	  get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'    
	  patch 'users/:id' => 'devise/registrations#update', as: 'user_registration'            
	end
  resources :missions, only: [:show, :new, :create, :edit, :update] do
    get 'new_show', on: :member
  end
  resources :providers, only: [:show, :new, :create, :edit, :update] do
  	get 'completed', on: :member
  end
  root 'providers#show', id: 'spacex'
end
