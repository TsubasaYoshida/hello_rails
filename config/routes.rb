Rails.application.routes.draw do
  resources :blogs do
    resources :entries, except: [:index] do
      resources :comments, only: [:create, :destroy] do
        patch :approve, on: :member
      end
    end
  end
end
