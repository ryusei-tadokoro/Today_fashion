# config/routes.rb
Rails.application.routes.draw do
  resources :closets do
    get 'subcategories_for_category/:category_id', on: :collection, to: 'closets#subcategories_for_category'
  end
  post '/callback' => 'linebot#callback'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'users/sign_up/:step', to: 'users/registrations#new', as: :new_user_registration_step
    post 'users/sign_up/:step', to: 'users/registrations#create'
    get 'users/cancel_account', to: 'users/registrations#cancel_account', as: 'cancel_account_user'
  end

  authenticated :user do
    root 'weather#index', as: :authenticated_root
  end

  root 'home#index'

  get 'home/index'
  get 'weather', to: 'weather#index', as: :weather
  get 'weather/show', to: 'weather#show', as: :show_weather
  get 'privacy_policy', to: 'static_pages#privacy_policy', as: :privacy_policy
  get 'terms_of_service', to: 'static_pages#terms_of_service', as: :terms_of_service
  post 'vision_api/upload', to: 'vision_api#upload'

  namespace :public do
    resources :contacts, only: %i[new create index] do
      collection do
        post 'confirm'
        post 'back'
        get 'done'
      end
    end
  end
end
