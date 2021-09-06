Rails.application.routes.draw do
  resources :hotels, only: %i[index create show destroy]
  post 'login', to: 'authentication#create'
  post 'register', to: 'users#create'
  resources :favourites, only: %i[index create destroy]
  resources :users, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
