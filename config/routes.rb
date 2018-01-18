Rails.application.routes.draw do
  resource :photos, only: [:index, :new, :create]

  root to: "photos#index"
end

