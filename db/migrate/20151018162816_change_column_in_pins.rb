class ChangeColumnInPins < ActiveRecord::Migration
  def change
    rename_column :pins, :member_id, :user_id
  end
end
