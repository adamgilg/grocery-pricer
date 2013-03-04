class CreateShoppingList < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.integer :user_id
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
