class RemoveForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :items, column: "user_id"
    remove_foreign_key :pins, column: "user_id"
  end
end
