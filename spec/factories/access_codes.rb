# == Schema Information
#
# Table name: access_codes
#
#  id          :integer          not null, primary key
#  access_code :integer
#  stylist_id  :integer
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :access_code do
    access_code 1
stylist_id 1
team_id 1
  end

end
