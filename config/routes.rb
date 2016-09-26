Rails.application.routes.draw do

  resources :articulos do
  		 resources :comments, only: [:create, :destroy, :update] 	
  end
  devise_for :users
  
  #=begin
  #	get "/articulos" index	
  	
  #=end
 
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
