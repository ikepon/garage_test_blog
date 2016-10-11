Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # doorkeeper で root_path が必要なので仮で設定
  root :to => 'users#root'

  use_doorkeeper

  scope :v1 do
    resources :users, only: %i(index show update)
    resources :posts
  end
end
