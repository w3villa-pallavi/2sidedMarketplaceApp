Rails.application.routes.draw do
  root "pages#home"
  get "pages/about_us"

  get "subscribers/complete"
  get "subscribers/cancel"
  resources :subscribers

  # runners_root_path => "runners#edit"
  
  resources :profiles

  devise_for :runners
  # , :controllers => { runners: "runners"}
  resources :runners do
    member do
      get "delete"
    end
  end
end
