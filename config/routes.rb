Rails.application.routes.draw do
  resources :hotels, only: %i[index create show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
