# == Schema Information
#
# Table name: fashionboards
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer
#

require 'rails_helper'

RSpec.describe Fashionboard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
