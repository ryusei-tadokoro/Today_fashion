Rails.application.routes.draw do
  root 'static_pages#top'
  devise_for :users, controllers: {
    # ↓ローカルに追加されたコントローラーを参照する(コントローラー名: "コントローラーの参照先")
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  get 'weather', to: 'weather#index', as: :weather
  get 'weather/show', to: 'weather#show', as: :show_weather
end
