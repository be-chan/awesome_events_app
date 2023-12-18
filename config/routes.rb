Rails.application.routes.draw do
  resources :events do
    resources :tickets
  end
  resources :retirements
  
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy", as: :logout
end
