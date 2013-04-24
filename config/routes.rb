Intranet::Application.routes.draw do
  resources :employees

  resources :users, except: [:edit, :new]
  resources :sessions

  root to: 'application#start'
  match "*path", to: 'application#start'
end
