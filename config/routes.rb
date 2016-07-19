Rails.application.routes.draw do
  get 'users/new'

  #get 'static_pages/home'

  #get 'static_pages/help'

  #get 'static_pages/about'

  root to: 'static_pages#home'

  match '/about', to: 'static_pages#about', via: [:get, :post]
  
  match '/help', to: 'static_pages#help', via: [:get, :post]

  match '/signup', to: 'users#new', via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
