Intranet::Application.routes.draw do
  resources :datafiles
  resources :demands
  resources :roles
  resources :units
  resources :employees
  resources :projects
  resources :subjects
  resources :employees
  resources :people

  resources :users, except: [:edit, :new]

  root to: 'application#start'
  match "*path", to: 'application#start'
  get "units/tree"
end
