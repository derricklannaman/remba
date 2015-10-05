class User < ActiveRecord::Base

  has_one :dashboard, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_dashboard_and_fashion_board

  def create_dashboard_and_fashion_board
    Fashionboard.create(user_id: self.id)
    Dashboard.create(user_id: self.id) if is_stylist?
  end

  def is_stylist?
    self.stylist == true
  end

end
