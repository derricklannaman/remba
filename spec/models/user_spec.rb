# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stylist                :boolean
#  status                 :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new }

  describe '#is_stylist?' do
    it 'returns true when a user is a stylist' do
      user.stylist = true
      expect(user.is_stylist?).to be true
    end
  end

  describe '#is_member?' do
    it 'returns false when user is a member' do
      user.stylist = false
      expect(user.is_member?).to be true
    end
  end


end
