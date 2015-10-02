class AddStylistFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :stylist, :boolean
  end
end
