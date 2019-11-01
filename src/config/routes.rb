Rails.application.routes.draw do
  
  devise_for :runners
  
  root "pages#home"
  get "pages/about_us"

  resources :runners do
    member do
      get "delete"
    end
  end
end
