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

class AccessCode < ActiveRecord::Base
  belongs_to :stylists
  belongs_to :teams

  before_create :generate_key

  def generate_key
    self.connection_key = loop do
      random_key = SecureRandom.uuid
      break random_key unless AccessCode.where(connection_key: random_key).exists?
    end
  end


end
