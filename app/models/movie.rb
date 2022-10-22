class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lits, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
end
