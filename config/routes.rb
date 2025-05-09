Rails.application.routes.draw do
  resources :excluded_strategem_keywords
  resources :squad_leaders
  resources :wargear_options
  resources :users
  resources :games_secondary_objectives
  resources :mission_rules
  resources :terrain_layouts
  resources :deployments
  resources :friends
  resources :games
  resources :lists
  resources :keywords
  resources :enhancement_keywords
  resources :enhancements
  resources :abilities
  resources :model_keywords
  resources :strategem_keywords
  resources :strategems
  resources :available_strategems
  resources :weapon_abilities
  resources :weapons
  resources :model_weapons
  resources :models
  resources :units
  resources :detachments
  resources :armies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
