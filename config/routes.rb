Monmenuhebdo::Application.routes.draw do
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
