Rails.application.routes.draw do
  devise_for :users
  # cty222 mark
  # mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'app_description#index'
  resources :app_description
  resources :how_to_use
  resources :git_hub
  resources :about_us do
    collection do
      post :email_contact
    end
  end
  resources :midi_drum do
    collection do
      post :test5
      get :test
    end
  end
  resources :groove do
    collection do
      get :editer
      post :load_groove
    end
  end
  
  match '/system_admin/:main_menu/:sub_menu', to: 'system_admin#show', via: :get
  match '/system_admin/:main_menu/:sub_menu', to: 'system_admin#update', via: :post

    
  match '/500', to: 'error_handle_page#error_500', via: :all
  match '/404', to: 'error_handle_page#error_404', via: :all
  match '/422', to: 'error_handle_page#error_422', via: :all
  match '/error_monitor' => 'error_handle_page#error_monitor', via: :all
  
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
