Rails.application.routes.draw do
  resources :listings do
    collection do
      get 'registar'
      get 'options'
      get 'setting'
      get 'tag'
      get 'data'
    end
  end

  root to: 'listings#tag'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  resources :users, only: %i[index show]

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  namespace :apis do
    get '/', action: 'index'
    post '/', action: 'create'
  end

  resources :apis, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
