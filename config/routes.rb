Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :songs

  root to: 'songs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
