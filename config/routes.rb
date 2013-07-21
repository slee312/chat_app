ChatApp::Application.routes.draw do
  root to: 'static_pages#home'
  get 'faq', to: 'static_pages#faq' 
  get 'about', to: 'static_pages#about' 
  get 'terms', to: 'static_pages#terms' 
  get 'contact', to: 'static_pages#contact' 
end
