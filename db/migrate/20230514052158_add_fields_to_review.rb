class AddFieldsToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :headline, :string
    add_column :reviews, :content, :string
  end
end
