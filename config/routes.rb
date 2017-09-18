Rails.application.routes.draw do
  get 'welcome/index'

  # added for search
  #post 'welcome/create'
  post 'welcome/index', to: 'welcome#create'

  #resources :reviews
  resources :movies do
    resources :reviews
  end

  get 'reviews', to: 'reviews#index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
