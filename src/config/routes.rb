Rails.application.routes.draw do
  root "pages#home"
  get "pages/about_us"

  get "subscribers/complete"
  get "subscribers/cancel"
  resources :subscribers
  
  resources :profiles

  devise_for :runners
  resources :runners do
    member do
      get "delete"
    end
  end
end
