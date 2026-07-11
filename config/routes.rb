Rails.application.routes.draw do
  devise_for :users
  get 'dashboard/index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"
  get "dashboard", to: "dashboard#index"
  get "difficulties", to: "difficulties#index"
  get "records", to: "records#index"
  get "questions/:difficulty", to: "questions#show", as: :question
  get "completions/:id", to: "completions#show", as: :completion
  post "questions/:difficulty/complete", to: "questions#complete", as: :complete_question
end
