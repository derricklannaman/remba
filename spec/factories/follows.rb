# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  target_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :follow do
    target_id 1
member_id 1
  end

end
