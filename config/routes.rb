Rails.application.routes.draw do
  resources :users

  #get 'static_pages/home'

  #get 'static_pages/help'

  #get 'static_pages/about'

  root to: 'static_pages#home'

  match '/about', to: 'static_pages#about', via: [:get]
  
  match '/help', to: 'static_pages#help', via: [:get]

  # get the sign up form
  match '/signup', to: 'users#new', via: [:get]

  # create new user using info from form
  match '/users', to: 'users#create', via: [:post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
