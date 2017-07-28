json.extract! song, :id, :title, :release, :url, :singer_id, :album_id, :genre_id, :privacity, :created_at, :updated_at
json.url song_url(song, format: :json)
