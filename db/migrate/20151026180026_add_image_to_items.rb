class AddImageToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_image_id, :string
  end
end
