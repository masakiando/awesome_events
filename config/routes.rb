Rails.application.routes.draw do

  # root to: 'welcome/index'
  root "welcome#index"
  get "/auth/:provider/callback" => "sessions#create"
  get '/logout' => 'sessions#destroy', as: :logout

  resources :events do
    resources :tickets 
  end
end
