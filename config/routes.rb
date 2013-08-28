ChatApp::Application.routes.draw do
  root to: 'static_pages#home'
  get 'home', to: 'posts#home'
  get 'faq', to: 'static_pages#faq' 
  get 'about', to: 'static_pages#about' 
  get 'terms', to: 'static_pages#terms' 
  get 'contact', to: 'static_pages#contact' 
  post 'verify_status', to: 'static_pages#verify_status'
end
