class ChangeNameOfProfiles < ActiveRecord::Migration
  def change
    rename_table :profiles, :profile_contents
  end
end
