class CreateFashionboards < ActiveRecord::Migration
  def change
    create_table :fashionboards do |t|
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :fashionboards, :user_id
  end
end
