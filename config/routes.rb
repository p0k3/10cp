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

    get '/subjects/:id/validate', to: "admin/subjects#validate", as: :validate_subject
    get '/subjects/:id/disable', to: "admin/subjects#disable", as: :disable_subject
  end

  resources :themes do
    resources :subjects, controller: "themes/subjects"
  end

  resources :subjects do
    resources :advices, controller: "subjects/advices"
  end

  scope '/me' do
    root to: 'me/accounts#home', as: :me
    resources :users, controller: "me/users", as: :me
  end

  resources :votes, controller: "votes", as: :votes, only: :create
  resources :users

  get '/search', to: "search#index"


  get '/:page', to: "pages#show",as: :page

  root to: 'pages#home'

end
