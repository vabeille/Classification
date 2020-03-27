Rails.application.routes.draw do
  get 'cartons_imports/new'
  get 'cartons_imports/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cartons do
    resources :dossiers, only: [:new, :create, :edit, :update, :destroy]
    collection do                       # collection => no carton id in URL
      get 'sensible'
    end
  end
end
