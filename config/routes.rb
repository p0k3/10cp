DixConseilsPour::Application.routes.draw do

  devise_for :users

  scope '/admin' do
    root to: 'admin/home#index'
    resources :themes, controller: "admin/themes"
  end

  resources :subjects do
    resources :advices
  end
  resources :users

  root to: 'pages#home'

end
