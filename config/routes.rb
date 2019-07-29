Rails.application.routes.draw do
  resources :blogs do
    resources :entries
  end
end
