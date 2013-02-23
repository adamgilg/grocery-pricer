class AddColumnToStoreReview < ActiveRecord::Migration
  def change
    add_column :store_reviews, :body, :text
    add_column :store_reviews, :rating, :integer
  end
end
