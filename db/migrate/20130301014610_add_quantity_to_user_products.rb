class AddQuantityToUserProducts < ActiveRecord::Migration
  def change
    add_column :user_products, :quantity, :integer
  end
end
