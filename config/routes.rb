Rails.application.routes.draw do
  resources :gyms, only: [:index, :show, :update, :destroy]
  resources :clients, only: [ :index, :show, :update]
  resources :memberships, only: [:create]


end
