Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  namespace :api do
    resources :orders, :only => [:index, :show, :create, :destroy, :update]
    post 'orders/:vendor' => 'orders#create'

    resources :devices, :only => [:index, :show, :create, :destroy, :update] do
      collection do
        post 'send_measurement'
      end
    end
    resources :readings, :only => [:index, :show, :create, :destroy, :update]
  end

  resources :devices, :only => [:index]
  resources :orders, :only => [:index]
end
