Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'home/index'
  get 'home/show'
  get 'home/edit'
  get 'home/setting'

  root to:"home#index"

  devise_for :users, :controllers => {
    :registrations  => 'users/registrations',
    :sessions       => 'users/sessions',
    :passwords      => 'users/passwords'
  }
  resources :users, :only => [:index, :show]

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
