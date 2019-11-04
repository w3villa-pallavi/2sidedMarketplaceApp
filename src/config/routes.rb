Rails.application.routes.draw do
  root "pages#home"

  resources :profiles

  get "subscribers/complete"
  get "subscribers/cancel"
  resources :subscribers




  devise_for :runners
  

  get "pages/about_us"

  resources :runners do
    member do
      get "delete"
    end
  end
end
