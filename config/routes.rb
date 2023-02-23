Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :entities, only: [:new, :create, :destroy]
  end
  resources :users
  
  devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'first_page#index'
    end
  end
end
