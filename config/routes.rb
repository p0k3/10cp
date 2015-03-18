DixConseilsPour::Application.routes.draw do

  devise_for :users

  constraints(subdomain: /admin/) do
    mount RailsAdmin::Engine => '/', as: 'rails_admin'
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
