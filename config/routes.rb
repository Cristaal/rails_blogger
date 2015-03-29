Rails.application.routes.draw do


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :users, only: :show
  resources :posts do
    resources :comments
  end
end
