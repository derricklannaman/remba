# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :user
  attachment :item_image
end
