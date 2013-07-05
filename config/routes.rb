DixConseilsPour::Application.routes.draw do

  devise_for :users

  resources :subjects do
    resources :advices
  end
  resources :users

  root to: 'subjects#index'

end
