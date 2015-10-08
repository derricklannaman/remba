class CreateAdviceboards < ActiveRecord::Migration
  def change
    create_table :adviceboards do |t|
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :adviceboards, :user_id
  end
end
