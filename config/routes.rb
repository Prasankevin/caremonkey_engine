Caremonkey::Application.routes.draw do
   
  resources :accounts do
    put 'update_password', :on=>:collection
    put 'update_sign_up2',:on=>:collection
    get 'find_name',:on=>:member
  end
  resources :carers
  resources :profiles
  resources :subjects
  resources :safety_alerts
  resources :notes
  resources :operations
  resources :family_histories
  resources :immunisations
  resources :emergency_contacts
  resources :emergency_informations
  resources :attachments
devise_for :users,:controllers => {:registrations => "registrations",:sessions=>"sessions",:passwords=>"passwords",:confirmations=>"confirmations"}
root :to => "profiles#index"
  devise_scope :user do
    get "sign_in",:to=>"caremonkey_engine/sessions#new"
    get "sign_up",:to=>"caremonkey_engine/registrations#new"
    get "logout",:to=>"caremonkey_engine/devise/sessions#destroy"
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
  # match ':controller(/:action(/:id(.:format)))'
end
