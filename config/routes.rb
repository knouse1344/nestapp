Knouse::Application.routes.draw do

  get 'blogposts/index'

  get "welcome/index"
  get "welcome/engineering"
  get "welcome/entrepreneurship"
  get "welcome/design"
  get "welcome/blog"
  get 'documents/resume'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'welcome#blog'

  resources :blogposts
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get "sessions/new"
  get "sessions/destroy"
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signup', to: 'users#new', via: 'get'
  
end
