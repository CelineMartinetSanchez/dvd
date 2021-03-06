Dvd::Application.routes.draw do

  # Users routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/profile' => 'users#show'

  # Different roots according to authentifications
  devise_scope :user do
    authenticated :user do
      root :to => 'quizzes#index', as: :authenticated_root
    end

    # get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #   unauthenticated :user do
  #     root :to => 'high_voltage/pages#show', id: 'home', as: :unauthenticated_root
      
  #   end
  end  

  resources :quizzes  do
    resources :questions 
    resources :questions_quizzes, only: :update
  end

  resources :questions do
    resources :answers
  end

  # resources :proposals

  # Pages statiques

  get '/a-propos' => 'high_voltage/pages#show', id: 'about', as: :about


  root to: 'high_voltage/pages#show', id: 'home'

  post '/quizzes/:id/send_score' =>  'score#send_score', as: :send_score
  get '/quizzes/:id/score' => 'score#show', as: :score


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'tests#index'

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
