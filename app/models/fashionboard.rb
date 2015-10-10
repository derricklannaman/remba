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

class Fashionboard < ActiveRecord::Base
  belongs_to :user
end
