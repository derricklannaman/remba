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

class AccessCode < ActiveRecord::Base
  belongs_to :stylist
  belongs_to :team
end
