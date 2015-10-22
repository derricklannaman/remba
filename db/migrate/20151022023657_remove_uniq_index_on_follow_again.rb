class RemoveUniqIndexOnFollowAgain < ActiveRecord::Migration
  def change
    remove_index :follows, :name => 'index_follows_on_target_id_and_user_id'
    add_index :follows, [:target_id, :user_id], :unique => false
  end
end
