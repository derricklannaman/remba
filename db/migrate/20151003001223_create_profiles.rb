class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :photo
      t.text :description

      t.timestamps null: false
    end
    add_index :profiles, :user_id
  end
end
