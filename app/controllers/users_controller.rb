class UsersController < Devise::RegistrationsController

  def create
    build_resource(registration_params)
    case params.require(:user).permit(:type)[:type]
    when 'Customer'
      resource.type = 'User::Buyer::Customer'
    when 'Shopkeeper'
      resource.type = "User::Buyer::Shopkeeper"
    when 'Vendor'
      resource.type = "User::Buyer::Vendor"
    end
    if resource.valid?
      sign_up(resource_name, resource)
      flash[:notice] = 'User Successfully created!'
      redirect_to root_path
    else
      flash[:notice] = resource.errors.full_messages.join(', ')
      render 'new'
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :age, :factory_id, :email, :password)
  end
end
