Blog::Application.routes.draw do

  resources :subjects do
    resources :advices
  end

  root to: 'subjects#index'

end
