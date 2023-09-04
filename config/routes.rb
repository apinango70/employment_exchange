Rails.application.routes.draw do
  resources :job_postings
  get 'pages/index'
  get 'job_postings/index'
  #devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "job_postings#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions', # Personaliza el controlador de sesiones
    registrations: 'users/registrations', # Personaliza el controlador de registros
    # Agrega otros controladores personalizados aquí si los has generado
  }
  
end
