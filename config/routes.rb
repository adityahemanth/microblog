Rails.application.routes.draw do

  get 'sessions/new'

  get 'serssions/new'

  resources :microposts
  resources :users
  
  get '/home', to: 'static_pages#home'

  get '/help', to:'static_pages#help'

  get '/about', to:'static_pages#about'

  get '/signup', to:'users#new'

  post 'signup', to: 'users#create'

  get '/login', to:'sessions#new'

  post 'login', to:'sessions#create'

  delete '/logout', to:'sessions#destroy'
   
  root "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
