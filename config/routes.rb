Rails.application.routes.draw do
  get 'events/show'

  root 'home#show'

  get '/members/new' => 'members#new', as: :new_member

  get '/members/edit' => 'members#edit', as: :edit_member 

  get '/members' => 'members#show', as: :show_member

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy', as: :logout

  get '/user/:id/show_all_user' => 'user#show_all', as: :show_all_user

  delete '/user/:id/show_all_user' => 'user#destroy', as: :delete_user

  get '/user/:id' => 'user#show', as: :user_page

  patch '/user/:id' => 'user#edit', as: :edit_user

  post '/user/:id/add_user' => 'user#create'

  get '/user/:id/add_user' => 'user#new', as: :new_user

  get '/contact' => 'contact#show', as: :show_contact

  get '/contact/edit' => 'contact#edit', as: :edit_contact

  get '/events' => 'events#show', as: :show_events

  get '/events/edit' => 'events#edit', as: :edit_events


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
