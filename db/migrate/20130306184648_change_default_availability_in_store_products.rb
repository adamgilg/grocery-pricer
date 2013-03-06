class ChangeDefaultAvailabilityInStoreProducts < ActiveRecord::Migration
  def change
    change_column :store_products, :availability, :boolean, default: true
  end
end
