DixConseilsPour::Application.routes.draw do

  mount RailsEmailPreview::Engine, at: 'emails'

  namespace :admin do
    resources :subjects
  end

  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    get "/connexion" => "devise/sessions#new", as: :new_user_session
    post "/connexion" => "devise/sessions#create", as: :user_session
    delete "/deconnexion" => "devise/sessions#destroy", as: :destroy_user_session
    get "/devenir-conseiller" => "users/registrations#new", as: :new_user_registration
    post "/devenir-conseiller" => "users/registrations#create", as: :user_registration
  end

  constraints(subdomain: /admin/) do
    get '/', to: "admin/dashboard#index"
    resources :themes, controller: "admin/themes", as: :admin_themes
    resources :subjects, controller: "admin/subjects", as: :admin_subjects
    resources :advices, controller: "admin/advices", as: :admin_advices
    resources :votes, controller: "admin/votes", as: :admin_votes
    resources :users, controller: "admin/users", as: :admin_users

    get '/subjects/:id/validate', to: 'admin/subjects#validate', as: :validate_subject
    get '/subjects/:id/invalidate', to: 'admin/subjects#invalidate', as: :invalidate_subject
    get '/advices/:id/validate', to: 'admin/advices#validate', as: :validate_advice
    get '/advices/:id/invalidate', to: 'admin/advices#invalidate', as: :invalidate_advice
  end

  get '/themes/:slug-:id', to: "themes#show", as: :theme
  get '/sujets/:slug-:id', to: "subjects#show", as: :subject
  get '/sujets/:slug-:subject_id/conseil-:id', to: "subjects/advices#show", as: :subject_advice
  get '/sitemap', to: "pages#sitemap"

  get '/sujets/:subject_slug-:subject_id/nouveau-conseil', to: "subjects/advices#new", as: :new_subject_advice
  get '/themes/:theme_slug-:theme_id/nouveau-sujet', to: "themes/subjects#new", as: :new_theme_subject

  resources :themes do
    resources :subjects, controller: "themes/subjects", only: [:create]
  end

  resources :subjects do
    resources :advices, controller: "subjects/advices", only: [:create]
  end

  scope '/me' do
    root to: 'me/accounts#home', as: :me
    resources :users, controller: "me/users", as: :me
  end

  get 'auth/facebook', to: "authentications#facebook", as: :link_with_facebook

  get '/auth/:provider/callback' => 'authentications#create'

  resources :votes, controller: "votes", as: :votes, only: :create
  resources :advices, controller: "advices", as: :advices, only: :index
  resources :users, only: [:show, :create, :update]

  get '/search', to: "search#index"

  get '/:page', to: "pages#show",as: :page


  root to: 'pages#home'

end
