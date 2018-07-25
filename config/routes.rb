Rails.application.routes.draw do
  resources :inscriptions do
    resources :inscription_items
  end
  resources :institutions
  resources :events do
    resources :stages
  end
  resources :events do
    resources :event_items
  end
  resources :events do
    get 'inscriptions/new', to: 'inscriptions#new', as: 'new_inscription'
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
