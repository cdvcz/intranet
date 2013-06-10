Intranet::Application.routes.draw do
  resources :contracts


  scope format: true, constraints: { :format => 'json' } do
    resources :datafiles
    resources :demands
    resources :roles
    resources :units do
      get :tree, on: :member
    end
    resources :employees
    resources :projects
    resources :subjects
    resources :employees
    resources :people
    resources :users, except: [:edit, :new]
  end

  resources :sessions, only: [:create, :destroy]

  root to: 'application#start'
  match "*path", to: 'application#start'
end
