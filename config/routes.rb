Monmenuhebdo::Application.routes.draw do

  devise_for :admins, module: 'private', skip: [:sessions]
  as :admin do
    get 'login' => 'private/sessions#new', as: :new_admin_session
    post 'login' => 'private/sessions#create', as: :admin_session
    delete 'logout' => 'private/sessions#destroy', as: :destroy_admin_session
  end

  namespace :private do
    resources :subscribers do
      member do
        get :validate
      end
    end
    resources :menu_templates do
      resources :days
    end
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
