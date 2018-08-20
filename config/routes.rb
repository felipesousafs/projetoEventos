Rails.application.routes.draw do
  resources :locations
  resources :events do
    resources :moderators
  end
  resources :events do
  end
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
    get 'tag_list', to: 'events#tag_list', as: 'tag_list'
    patch 'add_moderator', to: 'events#add_moderator', as: 'add_moderator'
  end
  post '/events/:parent_id/satellites/new_from_event', to: 'events#satellite_from_existing_event', as: 'new_satellite_from_event'
  get '/events/:parent_id/satellites/new', to: 'events#new_satellite', as: 'new_satellite'

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
  devise_scope :user do

    get 'users/:user_id/tag_list', to: 'users/registrations#tag_list', as: 'user_tag_list'

  end


  get '/events/type/:event_type_id', to: 'events#index', as: 'events_by_type'
  root 'wellcome#index'

end
