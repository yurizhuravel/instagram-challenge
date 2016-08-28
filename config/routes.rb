Rails.application.routes.draw do

  devise_for :users

  resources :snaps

  root 'snaps#index'

end
