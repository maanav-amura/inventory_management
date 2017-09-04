class User::Manager < User
  has_and_belongs_to_many :products
end
