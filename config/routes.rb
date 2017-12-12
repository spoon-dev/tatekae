Rails.application.routes.draw do
  root to: "events#index"

  resources :events do
    resources :items
  end
end
