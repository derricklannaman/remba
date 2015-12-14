class ChangeUserColumnNameFromPhotoToProfileImageId < ActiveRecord::Migration
  def change
    rename_column :profiles, :photo, :profile_image_id
  end
end
