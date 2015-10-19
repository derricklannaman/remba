# == Schema Information
#
# Table name: stylists
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stylist < ActiveRecord::Base
  has_many :access_codes
  has_many :teams, through: :access_codes
end
