DixConseilsPour::Application.routes.draw do


  constraints(subdomain: /admin/) do
    root to: 'admin/home#index'
    resources :themes, controller: "admin/themes"
    resources :subjects, controller: "admin/subjects"
  end

  resources :subjects do
    resources :advices
  end
  resources :users
  resources :themes, controller: "themes", as: :themes


  devise_for :users

  root to: 'pages#home'

end
