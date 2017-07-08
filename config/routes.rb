Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :work_types
  resources :moderation_types
  resources :user_collections
  resources :series_users
  resources :bookmark_bookmark_tags
  resources :types
  resources :collections
  resources :work_tags
  resources :work_users
  resources :subscription_pages
  resources :bookmarks
  resources :bookmark_tags
  resources :tags
  resources :series
  resources :likes
  resources :subscriptions
  resources :histories
  resources :blacklists
  resources :chapters
  resources :works do
    member do
      get 'new_chapter_on_work'
    end
    member do
      get 'reorder_work_chapters'
    end
    member do
      get 'delete_chapter_image'
    end
    member do
      get 'delete_chapter_audio'
    end
  end
  resources :tests
  resources :search
  get 'search_works' => "search#show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'search#index'
  match '/tag_suggestions', to: 'tag_suggestions#index', via: :get
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
