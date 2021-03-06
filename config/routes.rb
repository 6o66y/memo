Rails.application.routes.draw do
  get 'homes/about'
  get 'writers/edit'
  get 'writers/show'
  devise_for :writers, controllers: {
  	registrations: 'writers/registrations',
  	sessions: "writers/sessions"
  }

  devise_scope :writer do
  	get 'login' => 'writers/sessions#new'
  	post 'login' => 'writers/sessions#create'
  end

  root 'articles#index'
  resources :articles, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :writers, only: [:show, :edit, :update]

  get 'about' => 'homes#about'

  get 'writers/edit_password/:id' => 'writers#edit_password', as: 'edit_password'
  patch 'writers/update_password/:id' => 'writers#update_password', as: 'update_password'
end
