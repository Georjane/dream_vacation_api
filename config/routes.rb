Rails.application.routes.draw do
  resources :hotels, only: %i[index create show destroy]
  post 'login', to: 'authentication#create'
  post 'register', to: 'users#create'
  resources :favourites, only: %i[index create destroy]
  resources :users, only: :index

  # get 'sign_up', to: 'registrations#new'
  # post 'sign_up', to: 'registrations#create'
  # get 'sign_in', to: 'sessions#new'
  # post 'sign_in', to: 'sessions#create',
  # delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
