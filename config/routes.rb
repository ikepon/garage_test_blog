Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  use_doorkeeper

  scope :v1 do
    resources :users, only: %i(index show update)
  end
end
