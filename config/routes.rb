Rails.application.routes.draw do

  resources :profile_contacts
  get 'profile_contacts/swap/:id', to: 'profile_contacts#swap'
  get 'profile_contacts/add/:profile_id', to: 'profile_contacts#add'

  resources :profile_experiences
  get 'profile_experiences/swap/:id', to: 'profile_experiences#swap'
  get 'profile_experiences/add/:profile_id', to: 'profile_experiences#add'

  resources :profile_introductions
  get 'profile_introduction/swap/:id', to: 'profile_introductions#swap'
  get 'profile_introduction/add/:profile_id', to: 'profile_introductions#add'

  resources :profiles

  resources :user_to_interests

  resources :user_to_skills

  resources :interests

  resources :skills

  get 'control_panel/home'
  get 'user', to: 'users#show'
  get 'profile/:username', to: 'profiles#show'

  resources :user_to_project_tasks

  resources :project_tasks

  resources :project_to_tags

  resources :project_tags

  resources :user_project_follows

  resources :user_to_projects

  # get 'projects/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'auth/:provider/callback', to: 'sessions#omniauthcreate'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  # get "additional_info" => "sessions#newAdditionalInfo", :as => "additional_info"
  # post "additional_info" => "sessions#createAdditionalInfo", :as => "create_additional_info"
  root 'welcome#index'
  resources :users
  resources :sessions
  resources :password_resets
  resources :projects
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
