# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  title         :string
#  message       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  item_image_id :string
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
