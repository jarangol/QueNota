Rails.application.routes.draw do

  devise_for :users
  get 'users/profile', to: 'users#profile'

  root to: 'songs#index'
  #
  # #display a list of all songs
  # get '/songs', to: 'songs#index', as: 'songs'
  # # return an HTML form for creating a new song
  # get '/songs/new', to: 'songs#new', as:'new_song'
  # #create a new song
  # post '/songs', to: 'songs#create'
  # #display a specific song
  # get '/songs/:id', to: 'songs#show', as:'song'
  # #return an HTML form for editing a song
  # get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
  # #update a specific song
  # put '/songs/:id', to: 'songs#update'
  # #delete a specific song
  # delete '/songs/:id', to: 'songs#destroy'

  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
