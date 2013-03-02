class RemoveStoreIdFromUserProducts < ActiveRecord::Migration
  def up
    remove_column :user_products, :store_id
    add_column :user_products, :store_product_id, :integer
  end

  def down
    add_column :user_products, :store_id, :integer
    remove_column :user_products, :store_product_id
  end
end
