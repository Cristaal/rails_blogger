Rails.application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'home'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :users, only: :show
  resources :posts, except: :index
end
