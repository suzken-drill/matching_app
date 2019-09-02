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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
