class Rating < ApplicationRecord
  belongs_to :song
  validates_presence_of :song
  validates_inclusion_of :rate, :in => 1..5
end
