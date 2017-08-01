class Song < ApplicationRecord
  belongs_to :singer
  belongs_to :album
  belongs_to :genre
  has_many :ratings, :dependent => :destroy
end
