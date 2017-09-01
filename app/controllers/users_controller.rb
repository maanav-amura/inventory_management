class UsersController < Devise::RegistrationsController

  def create
    build_resource(registration_params)
    user =  sign_up(resource_name, resource)
    case  params.require(:user).permit(:type)[:type]
    when 'Customer'
      user.type = 'User::Buyer::Customer'
    when 'Shopkeeper'
      user.type = "User::Buyer::Shopkeeper"
    when 'Vendor'
      user.type = "User::Buyer::Vendor"
    end
    puts user.type
    user.save
    flash[:notice] = 'User Successfully created!'
    redirect_to root_path
  end

  private

  def registration_params
    params.require(:user).permit(:name, :age, :factory_id, :email, :password)
  end
end
