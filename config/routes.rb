Rails.application.routes.draw do
  resources :bloggers
  root to: "bloggers#index"
end
