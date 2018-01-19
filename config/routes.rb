Rails.application.routes.draw do
  # restrict photos route to the following actions
  # resources :photos, only: [:index, :new, :create]
  # no restrictions
  resources :photos

  # no path 'root' of the app
  root to: "photos#index"
end

