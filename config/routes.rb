Kongkong::Application.routes.draw do

  resources :create_credit_line_items

  resources :credits do
    resources :orders
  end

  resources :dailyposts do
    collection do
      get "today"
      get "by_days"
    end   
  end

  resources :shares
  resources :see_shares
  
  root to: "home#index" 
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  
  resources :losers do
    member do
      put 'payment'
    end
  end
  
  resources :girls do
    resources :dailyposts do
      member do
        put 'toggle_publish'
        put 'toggle_favor'
      end
    end
  end

  namespace :api do
    resources :shares
    resources :see_shares
    resources :girls
    resources :dailyposts do
      collection do
        get "today"
        get "by_days"
        get "home"
        get "my_girls"
      end

      member do
        post "toggle_favor"
        post "pay_it"
      end
    end

    resources :tokens, only: [:create, :destroy]

    resources :losers do
      collection do
        get 'aboutme'
      end
    end

    resources :users
    resources :credits
    resources :orders
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
