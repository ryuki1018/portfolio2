Rails.application.routes.draw do
  get 'visits/create'
  get 'visits/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'spots/index'
  get 'spots/show'
  get 'spots/new'
  get 'spots/create'
  get 'spots/edit'
  get 'spots/upload'
  get 'spots/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/upload'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    root to: 'users#index'
    
    get 'login' ,to:'sessions#new'
    post 'login' ,to:'sessions#create'
    delete 'logout', to:'sessions#destroy'
    
    get 'signup', to:'user#new'
    
    post 'update', to:'user#update'
    resources:users do
      
      post :confirm, action: :confirm_new, on: :new
      member do 
        get :visits
        get :visited
      end
    end
    
 
    resources:spots do
      collection do
        get :search
      end
    end
    resources:visits , only: [:create, :destroy]

end
