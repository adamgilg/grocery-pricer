class AddColumnToProductReview < ActiveRecord::Migration
  def change
    add_column :product_reviews, :body, :text
    add_column :product_reviews, :rating, :integer
  end
end
