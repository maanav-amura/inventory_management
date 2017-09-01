class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    puts resource
    puts root_path
    puts products_path
    if resource.is_a?(User::Manager)
      stored_location_for(resource) || products_path
    else
      stored_location_for(resource) ||  purchase_products_path
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

  def factory_manager?
    current_user.is_a?(User::Manager::FactoryManager)
  end

  def inventory_manager?
    current_user.is_a?(User::Manager::InventoryManager)
  end

  def sales_manager?
    current_user.is_a?(User::Manager::SalesManager)
  end

end
