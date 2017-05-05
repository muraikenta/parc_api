Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :create]do
    member do
      post :favorite
      delete :unfavorite
    end
  end

  resources :users, only: [:show] do
    member do
      post :follow
      delete :unfollow
    end
  end
end
