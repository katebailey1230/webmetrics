Rails.application.routes.draw do
  resources :users, only: [] do
   resources :registered_applications
 end

 devise_for :users


 authenticated do
   root to: 'registered_applications#index', as: :authenticated_root
 end

 get 'registered_applications/index'
 
 get 'welcome/index'
 get 'welcome/about'
 root to: 'welcome#index'

end
