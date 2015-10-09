class Member < User
  has_one :fashionboard, dependent: :destroy
  has_one :team, dependent: :destroy
end
