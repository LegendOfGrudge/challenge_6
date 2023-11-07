Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "customers#index"

  resources :customers, only: [:index, :new]

  get '/customers/missing_email', to: 'customers#missing_email'
  get '/customers/alphabetized', to: 'customers#alphabetized'
end
