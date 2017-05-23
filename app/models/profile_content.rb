# == Schema Information
#
# Table name: profiles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  photo       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProfileContent < ActiveRecord::Base
  belongs_to :user
end
