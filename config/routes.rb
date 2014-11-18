DrinkyApp::Application.routes.draw do

  devise_for :users

  devise_scope :users do
    root to: 'users#index'
    # get "signup", to: "devise/registrations#new"
    # get "login", to: "devise/sessions#new"
    # get "logout", to: "devise/sessions#destroy"
  end

  resources :users do
    resources :contacts
  end

# root to: "devise/sessions#new"
end
