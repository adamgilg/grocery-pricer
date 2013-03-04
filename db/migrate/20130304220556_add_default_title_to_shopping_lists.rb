class AddDefaultTitleToShoppingLists < ActiveRecord::Migration
  def change
    change_column :shopping_lists, :title, :string, default: "untitled list"
  end
end
