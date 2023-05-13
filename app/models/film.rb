class Film < ApplicationRecord
  serialize :watch_at, Array
  
  has_one_attached :poster

  validates :title, presence: true

end
