Rails.application.routes.draw do

  get 'asana/index'

  get 'asana/create'

  get 'asana/show'

  resources :activities

  resources :user_to_interests

  resources :user_to_skills

  resources :interests

  resources :skills

  get 'control_panel/home'

  resources :user_to_project_tasks

  resources :project_tasks

  resources :project_to_tags

  resources :project_tags

  resources :user_project_follows

  resources :user_to_projects

  # get 'projects/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'auth/facebook/callback', to: 'sessions#omniauthcreate'
  get 'auth/twitter/callback', to: 'sessions#omniauthcreate'
  get 'auth/linkedin/callback', to: 'sessions#omniauthcreate'
  get 'auth/asana/callback', to: 'asana#create'
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root 'welcome#index'
  resources :users do
    resources :notifications
    resources :requests
  end
  resources :sessions
  resources :password_resets
  resources :projects do
    resources :positions
    resources :project_posts do
      resources :project_comments
    end
    post "join_project" => "projects#join_request", :as => "join_project"
  end
  post "accept_project" => "projects#accept_request", :as => "accept_project"
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
