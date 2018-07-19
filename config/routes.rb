Rails.application.routes.draw do
  resources :institutions
  resources :inscription_items
  resources :tags
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  devise_scope :user do
    root to: 'users/sessions#index'
  end

end
