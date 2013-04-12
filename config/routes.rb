Intranet::Application.routes.draw do
  resources :users, except: [:edit, :new]
  resources :sessions

  root :to => "sessions#create"
end
