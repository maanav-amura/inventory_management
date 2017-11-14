class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

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

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
end
