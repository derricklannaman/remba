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
#  type                   :string
#

class User < ActiveRecord::Base
  has_one :dashboard, dependent: :destroy
  has_one :fashionboard, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_user_boards

  def create_user_boards
    create_fashionboard
    create_team
    create_dashboard
  end

  def create_fashionboard
    Fashionboard.create(user_id: self.id) if is_member?
  end

  def create_team
    Team.create(member_id: self.id, count: 0) if is_member?
  end

  def create_dashboard
    id = self.id
    Dashboard.create(user_id: id, stylist_id: id ) if is_stylist?
  end

  def is_stylist?
    self.stylist == true
  end

  def is_member?
    self.stylist == false
  end

end
