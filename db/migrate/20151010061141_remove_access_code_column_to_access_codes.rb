class RemoveAccessCodeColumnToAccessCodes < ActiveRecord::Migration
  def change
    remove_column :access_codes, :access_code, :string
  end
end
