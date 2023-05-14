class Film < ApplicationRecord
  serialize :watch_at, Array

  has_one_attached :poster
  has_one :review

  validates :title, presence: true

end
