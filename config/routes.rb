DrinkyApp::Application.routes.draw do

  devise_for :users

  resources :users do
    resources :contacts
    resources :meetings
    resources :reminders
  end



root to: 'home#index'

end
