class AddFieldsToFilm < ActiveRecord::Migration[7.0]
  def change
    add_column :films, :title, :string
    add_column :films, :language, :string
    add_column :films, :run_time, :string
    add_column :films, :gist, :string
    add_column :films, :watch_at, :string
    add_column :films, :can_watch, :string
  end
end
