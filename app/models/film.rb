class Film < ApplicationRecord
  serialize :watch_at, Array

  has_one_attached :poster
  has_one :review

  validates :title, presence: true

  scope :sorted, -> {order(arel_table[:published_at].desc.nulls_first).order(updated_at: :desc)}
  scope :draft, -> {where(published_at: nil)}
  scope :published, -> {where("published_at <=?", Time.current)}
  scope :scheduled, -> {where("published_at > ?", Time.current)}
  def draft?
    published_at.nil?
  end

  def scheduled?
    published_at? && published_at > Time.current
  end

  def published?
    published_at? && published_at <= Time.current
  end
end
