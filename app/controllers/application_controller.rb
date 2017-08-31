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

end
