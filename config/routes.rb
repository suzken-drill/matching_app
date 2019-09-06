Rails.application.routes.draw do

  # static_page
  root to: 'static_page#index'
  get 'static_page/help'
  get 'static_page/rule'
  get 'static_page/about'
  get 'static_page/owner'

  # contact_form
  resources :contacts, only: [:index, :create] do
  	collection do
  	  get 'confirm' => redirect("/contacts"), as: 'redirect_confirm'
  	  post 'confirm', to: 'contacts#confirm', as: 'confirm'
  	end
  end

  # shop_contact_form
  resources :shop_contacts, only: [:index, :create] do
  	collection do
  	  get 'confirm' => redirect("/shop_contacts"), as: 'redirect_confirm'
  	  post 'confirm', to: 'shop_contacts#confirm', as: 'confirm'
  	end
  end

  # devise
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :users do
    get ':id', to: 'users#show', as: "show_user"
  end
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }
  namespace :owners do
    get ':id', to: 'owners#show', as: "show_owner"
  end

  # active_admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # shops
  get 'shop/:id', to: 'shops#show', as: 'shop'

  # admin_posts
  resources :posts, controller: :admin_posts, only: [:index, :show]
  resources :reviews, controller: :admin_reviews, only: [:index, :show]

  # search
  get 'searchs/', to: 'searchs#index', as: 'searchs'

  # letter opener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # categories
  get ':slug1', to: 'categories#index', as: 'categories_slug1'
  get ':slug1/:slug2', to: 'categories#index', as: 'categories_slug2'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
