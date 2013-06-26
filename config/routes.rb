DixConseilsPour::Application.routes.draw do

  devise_for :users

  resources :subjects do
    resources :advices
  end

  root to: 'subjects#index'

end
