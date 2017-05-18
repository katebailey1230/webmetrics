Rails.application.routes.draw do
  devise_for :users
 get 'welcome/index'

 resources :users, only: [:show]
 resources :registered_applications
 root to: 'welcome#index'

 namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:GET]
   resources :events, only: [:create]
 end
end
