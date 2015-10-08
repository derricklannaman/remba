class Member < User
  has_one :fashionboard, dependent: :destroy
end
