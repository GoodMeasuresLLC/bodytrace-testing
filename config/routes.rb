Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  namespace :api do
    resources :orders, :only => [:index, :show, :create, :destroy, :update]
    resources :devices, :only => [:index, :show, :create, :destroy, :update]
    resources :readings, :only => [:index, :show, :create, :destroy, :update]
  end

  resources :devices, :only => [:index]
  resources :orders, :only => [:index]
end
