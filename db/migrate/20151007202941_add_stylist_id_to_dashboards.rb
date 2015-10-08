class AddStylistIdToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :stylist_id, :integer
    add_index :dashboards, :stylist_id
  end
end
