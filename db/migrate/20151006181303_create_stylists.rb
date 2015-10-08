class CreateStylists < ActiveRecord::Migration
  def change
    create_table :stylists do |t|

      t.timestamps null: false
    end
  end
end
