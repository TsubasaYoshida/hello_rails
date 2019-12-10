Rails.application.routes.draw do
  get 'home/index'
  get 'home/cognito'
  devise_for :users, controllers: {
      # Extends Devise registrations
      sessions: "custom/devise/sessions",
      registrations: "custom/devise/registrations",
      confirmations: "custom/devise/confirmations",
      omniauth_callbacks: "custom/devise/omniauth_callbacks"
  }
  resources :blogs do
    resources :entries, except: [:index] do
      resources :comments, only: [:create, :destroy] do
        patch :approve, on: :member
      end
    end
  end
end
