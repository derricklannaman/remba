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

require 'rails_helper'

RSpec.describe Feedback, type: :model do

  it "is valid with a name of Like it" do
  end

  it 'is valid with a name of Love it' do
  end

  it "is valid with a name of Leave it" do
  end

  it 'has a user_id' do
  end

  it 'has a item_id' do
  end


end
