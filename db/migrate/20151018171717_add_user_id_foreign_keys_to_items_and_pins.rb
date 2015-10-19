class AddUserIdForeignKeysToItemsAndPins < ActiveRecord::Migration
  def change
    add_foreign_key :items, :users
    add_foreign_key :pins, :users
  end
end
