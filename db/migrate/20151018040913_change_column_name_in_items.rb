class ChangeColumnNameInItems < ActiveRecord::Migration
  def change
    rename_column :items, :member_id, :user_id
  end
end
