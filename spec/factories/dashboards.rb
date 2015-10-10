# == Schema Information
#
# Table name: dashboards
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stylist_id :integer
#

FactoryGirl.define do
  factory :dashboard do
    user_id 1
  end

end
