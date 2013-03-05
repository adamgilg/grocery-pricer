class AddListIdToUserProducts < ActiveRecord::Migration
  def change
    add_column :user_products, :shopping_list_id, :integer
  end
end
