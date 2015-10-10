# == Schema Information
#
# Table name: adviceboards
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :adviceboard do
    user_id 1
  end

end
