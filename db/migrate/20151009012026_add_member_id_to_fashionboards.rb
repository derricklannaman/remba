class AddMemberIdToFashionboards < ActiveRecord::Migration
  def change
    add_column :fashionboards, :member_id, :integer
    add_index :fashionboards, :member_id
  end
end
