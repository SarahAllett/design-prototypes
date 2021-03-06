Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'styleguide' => 'application#styleguide'
  get 'patterns' => 'application#patterns'  
  get 'search_results' => 'application#search_results'
  get 'find_members' => 'application#find_members'
  get 'no_results' => 'application#no_results'
  get 'groups' => 'application#groups'
  get 'member_issue_activity' => 'application#member_issue_activity'

  resources :issues, only: [:index] do
    get '/people(.:format)', to: 'people#index_by_issue', as: 'people'
    get '/groups(.:format)', to: 'groups#index_by_issue', as: 'groups'
    get '/statutory_instruments(.:format)', to: 'statutory_instruments#index_by_issue', as: 'statutory_instruments'
  end

  resources :statutory_instruments, only: [:index, :show]
  resources :topics, only: [:index, :show]

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
