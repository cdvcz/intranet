Intranet::Application.routes.draw do

  mount CdvSession::Engine, at: '/'

  scope format: true, constraints: { :format => 'json' } do
    resources :contracts
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

  root to: 'application#start'
  match "*path", to: 'application#start'

end
