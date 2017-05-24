Rails.application.routes.draw do
  devise_for :users
 get 'welcome/index'
 get 'welcome/about'


 resources :registered_applications do
   resources :events
end

 namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]


end

 root to: 'welcome#index'
end
