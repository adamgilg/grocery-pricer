class AddPriceToStoreProduct < ActiveRecord::Migration
  def change
    add_column :store_products, :price, :integer
  end
end
