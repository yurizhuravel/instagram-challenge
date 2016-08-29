Rails.application.routes.draw do

  devise_for :users

  resources :snaps do
    resources :comments
  end

  root 'snaps#index'

end
