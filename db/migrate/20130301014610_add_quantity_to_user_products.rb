class AddQuantityToUserProducts < ActiveRecord::Migration
  def change
    add_column :user_products, :quantity, :integer, default: 1
  end
end
