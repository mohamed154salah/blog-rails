Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "main#index"
  get  "sign_up" ,to: "registration#new"
  post "sign_up" ,to: "registration#create"
  
  get  "password/resets" ,to: "password_resets#new"
  post "password/resets" ,to: "password_resets#create"
  
  get  "password/resets/edit" ,to: "password_resets#edit"
  patch "password/resets/edit" ,to: "password_resets#update"
  
  get  "password" ,to: "passwords#edit" ,as: :edit_password
  patch "password" ,to: "passwords#update"
  
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "sign_out" ,to: "sessions#destroy"

  # Defines the root path route ("/")
  # root "articles#index"
end
