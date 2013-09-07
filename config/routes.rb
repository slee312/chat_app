ChatApp::Application.routes.draw do
  get "users/new"
  get "sessions/new"
  get "sign_out", to: "sessions_#destroy", as: "sign_out"
  post "sessions", to: "sessions#create"
  post "users", to: "users#create"

  resources :clowds


  root to: 'static_pages#home'
  get 'home', to: 'posts#home'
  get 'faq', to: 'static_pages#faq' 
  get 'about', to: 'static_pages#about' 
  get 'terms', to: 'static_pages#terms' 
  get 'contact', to: 'static_pages#contact' 
  post 'verify_status', to: 'static_pages#verify_status'
end
