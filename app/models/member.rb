# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base
  # has_one :fashionboard, dependent: :destroy
  # has_one :team, dependent: :destroy
end
