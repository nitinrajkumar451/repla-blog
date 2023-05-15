class AddPublishedAtToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :published_at, :datetime
  end
end
