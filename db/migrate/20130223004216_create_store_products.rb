class CreateStoreProducts < ActiveRecord::Migration
  def change
    create_table :store_products do |t|
      t.integer :store_id
      t.integer :product_id
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
