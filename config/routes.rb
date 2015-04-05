Rails.application.routes.draw do

#the routes needs to be changed to the registrations controller instead of path_names: {sign_in: "login", sign_out: "logout"}
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: :show
  resources :posts
  resources :comments
end
