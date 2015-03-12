DixConseilsPour::Application.routes.draw do

  devise_for :users

  constraints(subdomain: /admin/) do
    root to: 'admin/home#index'
    resources :themes, controller: "admin/themes"
    resources :subjects, controller: "admin/subjects"
    resources :advices, controller: "admin/advices"
    devise_for :users

    get '/advices/:id/validate', to: "admin/advices#validate", as: :validate_advice
    get '/advices/:id/disable', to: "admin/advices#disable", as: :disable_advice
  end

  resources :subjects do
    resources :advices, controller: "subjects/advices"
  end

  scope '/me' do
    root to: 'me/accounts#home', as: :me
    resources :users, controller: "me/users", as: :me
  end

  resources :themes, controller: "themes", as: :themes
  resources :votes, controller: "votes", as: :votes, only: :create
  resources :users

  get '/search', to: "search#index"



  root to: 'pages#home'

end
