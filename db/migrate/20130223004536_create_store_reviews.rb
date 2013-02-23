class CreateStoreReviews < ActiveRecord::Migration
  def change
    create_table :store_reviews do |t|
      t.integer :store_id
      t.integer :user_id

      t.timestamps
    end
  end
end
