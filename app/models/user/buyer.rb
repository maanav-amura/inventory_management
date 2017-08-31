class User::Buyer < User
  def self.types
    %w[Customer Shopkeeper vendor]
  end
end
