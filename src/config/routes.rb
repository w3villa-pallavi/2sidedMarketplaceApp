Rails.application.routes.draw do
  root "pages#home"

  get 'profiles/index'
  get 'profiles/show'

  devise_for :runners
  

  get "pages/about_us"

  resources :runners do
    member do
      get "delete"
    end
  end
end
