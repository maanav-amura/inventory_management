class User::Buyer < User
  def self.types
    %w(Customer Shopkeeper Vendor)
  end
end
