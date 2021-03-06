PotholePatrol::Application.routes.draw do
  root to: "potholes#index"

  match "/auth/twitter/callback" => "sessions#create"
  match "/auth/facebook/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

  get   '/all_photos', to: 'photos#all_photos'
  get   '/potholes/about', to: 'potholes#about'
  get   '/potholes/team', to: 'potholes#team'
  resources :potholes do
    resources :photos
  end
  resources :photos, :votes, :users
end
