class CreateAccessCodes < ActiveRecord::Migration
  def change
    create_table :access_codes do |t|
      t.integer :access_code
      t.integer :stylist_id
      t.integer :team_id

      t.timestamps null: false
    end
    add_index :access_codes, :stylist_id
    add_index :access_codes, :team_id
  end
end
