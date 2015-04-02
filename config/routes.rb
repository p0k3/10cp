DixConseilsPour::Application.routes.draw do

  namespace :admin do
    resources :subjects
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  constraints(subdomain: /admin/) do
    get '/', to: "admin/dashboard#index"
    resources :themes, controller: "admin/themes", as: :admin_themes
    resources :subjects, controller: "admin/subjects", as: :admin_subjects
    resources :advices, controller: "admin/advices", as: :admin_advices
    resources :votes, controller: "admin/votes", as: :admin_votes
    resources :users, controller: "admin/users", as: :admin_users

    get '/subjects/:id/validate', to: 'admin/subjects#validate', as: :validate_subject
    get '/advices/:id/validate', to: 'admin/advices#validate', as: :validate_advice
  end

  get '/themes/:slug-:id', to: "themes#show", as: :theme
  get '/sujets/:slug-:id', to: "subjects#show", as: :subject
  get '/sitemap', to: "pages#sitemap"

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
  resources :advices, controller: "advices", as: :advices, only: :index
  resources :users, only: [:show, :create, :update]

  get '/search', to: "search#index"


  get '/:page', to: "pages#show",as: :page

  root to: 'pages#home'

end
