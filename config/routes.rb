Rails.application.routes.draw do
  get 'postulations/new'
  get 'postulations/create'
  resources :job_postings
  get 'pages/index'
  get 'job_postings/index'
  #devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "job_postings#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',  
    registrations: 'users/registrations',  
    
  }
  
  # Defino las rutas para que los usuarios que no sean admin, puedan postular a empleos
  resources :job_postings do
    resources :postulations, only: [:new, :create]
  end
end
