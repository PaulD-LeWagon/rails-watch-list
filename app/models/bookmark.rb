class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates_associated :movie
  validates_associated :list
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }
end
