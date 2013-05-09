Intranet::Application.routes.draw do
  resources :demands
  resources :roles
  resources :projects
  resources :subjects
  resources :employees
  resources :users, except: [:edit, :new]
  resources :sessions

  root to: 'application#start'
  match "*path", to: 'application#start'
end
