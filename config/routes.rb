Rails.application.routes.draw do
devise_for :users
  resources :users, only: [] do
   resources :registered_applications
 end
  resources :registered_applications

  authenticated do
     root to: 'registered_apps#index', as: :authenticated_root
   end

   get 'welcome/index'
   root to: 'welcome#index'

 end
