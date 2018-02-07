Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "movies#index"
  root "movies#show"
  devise_for :users
  resources :reviews, only: [:create]
  resources :movies, only: [:index, :show]
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
    end
    resources :countrys, only: [:show]
    resources :genres, only: [:show]
    resources :years, only: [:show]
    resources :tags, only: [:show]
  end
end
