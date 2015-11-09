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

FactoryGirl.define do
  factory :item do
    member nil
title "MyString"
message "MyText"
  end

end
