Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'
      resources :dogs, only: [:create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
