Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :achievements
  end

  root 'users#index'

end
