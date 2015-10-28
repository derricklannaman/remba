# == Schema Information
#
# Table name: pins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pin < ActiveRecord::Base
  has_many :item_images
  belongs_to :user
  belongs_to :item

  attachment :item_image

  validates :item, presence: true, uniqueness: {scope: :user}
  validates :user, presence: true, uniqueness: {scope: :item}

  include StreamRails::Activity
  as_activity

  def activity_object
    self.item
  end

end
