class UsersController < ApplicationController

  def profile
    @user_songs = current_user.songs
  end
end
