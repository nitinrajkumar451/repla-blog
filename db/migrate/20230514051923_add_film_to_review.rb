class AddFilmToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :film, null: false, foreign_key: true
  end
end
