Monmenuhebdo::Application.routes.draw do

  devise_for :admins, module: 'private'

  namespace :private do
    resources :subscribers
    root to: 'subscribers#index'
  end

  resources :subscribers, only: [:new, :create, :update] do
    member do
      get :validate
    end
    collection do
      get :validation
      get :thanks
    end
  end
  root to: 'subscribers#new'
end
