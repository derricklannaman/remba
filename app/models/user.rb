class User < ActiveRecord::Base
  has_one :dashboard, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_user_boards

  def create_user_boards
    create_fashionboard
    create_dashboard
  end

  def create_fashionboard
    Fashionboard.create(user_id: self.id) if is_member?
  end

  def create_dashboard
    Dashboard.create(user_id: self.id) if is_stylist?
  end

  def is_stylist?
    self.stylist == true
  end

  def is_member?
    self.stylist == false
  end

end
