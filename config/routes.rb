Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cartons do
    resources :dossiers, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users
    post "chrono", to: "cartons#chrono", as: :chrono
end
