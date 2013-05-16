Blog::Application.routes.draw do

  resources :advices

  root to: 'subjects#index'

end
