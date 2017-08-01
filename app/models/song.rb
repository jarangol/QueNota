class Song < ApplicationRecord
  ratyrate_rateable "title"
  belongs_to :singer
  belongs_to :album
  belongs_to :genre
  has_many   :ratings
end
