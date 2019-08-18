Rails.application.routes.draw do
  resources :lists do
	member do
  	  delete :soft_delete
  	end
  end

  resources :trashed_lists do
	member do
  	  put :restore
  	end
  end

  # get '/trash', controller: :trash, action: :show
  # get '/trash/lists', controller: :trash, action: :lists
  # get '/trash/list_items', controller: :trash, action: :list_items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'lists#index'
end
