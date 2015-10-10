class AddColumnAttributesOnTeams < ActiveRecord::Migration
  def change
    change_column :teams, :count, :integer, :default => 0, :limit => 3
  end
end
