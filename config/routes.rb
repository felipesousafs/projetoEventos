Rails.application.routes.draw do
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
  devise_scope :user do

    get 'users/:user_id/tag_list', to: 'users/registrations#tag_list', as: 'user_tag_list'

  end


  root 'events#index'

end
