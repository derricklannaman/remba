class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :count
      t.integer :member_id

      t.timestamps null: false
    end
    add_index :teams, :member_id
  end
end
