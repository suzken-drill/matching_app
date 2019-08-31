Rails.application.routes.draw do
  root to: 'static_page#index'
  get 'static_page/help'
  get 'static_page/rule'
  get 'static_page/about'
  get 'static_page/owner'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
