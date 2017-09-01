class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(User::Manager)
      stored_location_for(resource) || products_path
    else
      stored_location_for(resource) || purchase_products_path
    end
  end

  def customer?
    current_user.is_a?(User::Buyer::Customer)
  end

  def shopkeeper?
    current_user.is_a?(User::Buyer::Shopkeeper)
  end

  def vendor?
    current_user.is_a?(User::Buyer::Vendor)
  end

  def manager?
    current_user.is_a?(User::Manager)
  end
end
