class AddMoreStuctureToContentProfiles < ActiveRecord::Migration
  def change
    add_column :profile_contents, :profile_title, :string
    add_column :profile_contents, :first_section, :text
    add_column :profile_contents, :second_section, :text
    add_column :profile_contents, :third_section, :text
  end
end
