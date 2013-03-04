class AddListIdToUserProducts < ActiveRecord::Migration
  def change
    add_column :user_products, :list_id, :integer
  end
end
