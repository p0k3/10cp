Blog::Application.routes.draw do

  resources :subjects

  root to: 'subjects#index'

end
