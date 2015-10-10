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

FactoryGirl.define do
  factory :access_code do
    access_code "MyString"
stylist_id 1
team_id 1
  end

end
