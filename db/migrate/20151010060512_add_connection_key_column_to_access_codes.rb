class AddConnectionKeyColumnToAccessCodes < ActiveRecord::Migration
  def change
    add_column :access_codes, :connection_key, :string
  end
end
