class AddPublishedAtToFilms < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :published_at, :datetime
  end
end
