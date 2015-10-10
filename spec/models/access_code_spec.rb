# == Schema Information
#
# Table name: access_codes
#
#  id             :integer          not null, primary key
#  stylist_id     :integer
#  team_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  connection_key :string
#

require 'rails_helper'

RSpec.describe AccessCode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
