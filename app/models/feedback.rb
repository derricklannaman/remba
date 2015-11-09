# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  item_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
end
