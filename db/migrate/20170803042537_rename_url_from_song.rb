class RenameUrlFromSong < ActiveRecord::Migration[5.1]
  def change
    rename_column :songs, :url, :song_url
  end
end
