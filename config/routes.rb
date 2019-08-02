Rails.application.routes.draw do
  resources :blogs do
    resources :entries
  end
  resources :comments
end
