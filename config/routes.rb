Rails.application.routes.draw do
  root "movies#index"
  devise_for :users
  resources :toppage, only: [:index]
  resources :movies, only: [:index, :show] do
    resources :clips
    resources :reviews, only: [:show, :create] do
      resources :tags, only: [:index, :create]
      resource :comments, only: [:create]
    end
    collection do
      get "search"
      get "clip"
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
    resources :years, only: [:index,:show], path: '/year/:age_id'
    resources :tags, only: [:show]
    resources :awards, only: [:show]
  end
  resources :users do
    resources :relationships , only: [:create, :destroy]
    member do
      get "review"
      get "clip"
      get "fan"
      get "followers"
      get "following"
    end
  end

  resources :members do
    resources :users_members
    collection do
      get "fan"
    end
  end
end
