Rails.application.routes.draw do
  resources :institutions
  resources :events do
    resources :stages
  end
  resources :events do
    resources :event_items
  end
  resources :statuses
  resources :event_types
  resources :coupoms
  resources :coupom_types
  resources :tags
  resources :event_item_types
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  root 'events#index'

end
