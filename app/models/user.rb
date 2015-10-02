class User < ActiveRecord::Base

  has_one :dashboard, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_dashboard

  def create_dashboard
     if is_stylist?
      Dashboard.create(user_id: self.id)
     end
  end

  def is_stylist?
    self.stylist == true
  end

end
