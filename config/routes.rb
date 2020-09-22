Rails.application.routes.draw do
  resources :likes
  resources :posts

  get '/feeds', to: 'posts#feeds'

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users#, only: [:create]
        #Login route
        post '/login', to: 'auth#create'
        #Retrieve user route 
        get '/profile', to: 'users#profile'
        patch '/profile', to: 'users#update'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
