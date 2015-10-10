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

class Dashboard < ActiveRecord::Base
  belongs_to :user
end
