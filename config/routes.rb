Rails.application.routes.draw do
  get '/listings/registar' => 'listings#registar'
  get '/listings/:id/edit1' => 'listings#edit1'
  get '/listings/options' => 'listings#options'
  get '/listings/setting' => 'listings#setting'
  get '/listings/:id/setting1' => 'listings#setting1'
  get '/listings/tag' => 'listings#tag'
  resources :listings
  get 'users/index'
  get 'users/show'
  get 'home/index'

  root to: 'home#index'

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
