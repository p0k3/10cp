DixConseilsPour::Application.routes.draw do

  mount RailsEmailPreview::Engine, at: 'emails'

  namespace :admin do
    resources :subjects
  end

  devise_for :users, controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
    }

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

  get 'auth/facebook', to: "users/auth#facebook", as: :link_with_facebook
  get 'auth/facebook/callback', to: 'users#login'

  resources :votes, controller: "votes", as: :votes, only: :create
  resources :advices, controller: "advices", as: :advices, only: :index
  resources :users, only: [:show, :create, :update]

  get '/search', to: "search#index"

  get '/:page', to: "pages#show",as: :page


  root to: 'pages#home'

end
