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

FactoryGirl.define do
  factory :pin do
    member nil
item nil
  end

end
