class AddAvailabilityToStoreProducts < ActiveRecord::Migration
  def change
    add_column :store_products, :availability, :boolean, default: false
  end
end
