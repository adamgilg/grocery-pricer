class AddStoreIdToUserProducts < ActiveRecord::Migration
  def change
    add_column :user_products, :store_id, :integer
  end
end
