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
    member do
      get 'increment_chapter'
    end
    member do
      get 'decrement_chapter'
    end
  end
  resources :tests
  resources :search
  get 'search_works' => "search#show"
  root 'search#index'
  match '/tag_suggestions', to: 'tag_suggestions#index', via: :get
  get 'profile' => "profile#show"
  get 'creator_profile' => "profile#show_creator"
  get 'edit_user_info' => "profile#edit_user_info", via: :get
end
