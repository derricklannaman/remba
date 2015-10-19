class ChangeMemberIdToUserIdOnTeams < ActiveRecord::Migration
  def change
    rename_column :teams, :member_id, :user_id
  end
end
