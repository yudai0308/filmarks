Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "movies#index"
  # root "movies#show"
  devise_for :users
  resources :movies, only: [:index, :show] do
    resources :clips
    resources :reviews, only: [:index, :create] do
      resources :tags, only: [:index, :create]
    end
    collection do
      get "search"
    end
  end
  resource :lists, only: [:index] do
    collection do
      get "now"
      get "comming"
      get "upcomming"
      get "trend"
      get "country"
      get "genre"
      get "year"
      get "tag"
      get "index"
      get "user"
      get "award"
      get "/country/others" => "countries#others"
    end
    resources :countries, only: [:index], path: '/country/:country_id'
    resources :genres, only: [:show]
    resources :years, only: [:show]
    resources :tags, only: [:show]
    resources :awrds, only: [:show]
  end
  resources :users do
    resources :relationships , only: [:create, :destroy]
  end
end
