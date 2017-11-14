class UsersController < Devise::RegistrationsController
  before_action :authenticate_user!

  def create
    build_resource(registration_params)
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
    params.require(:user).permit(:name, :age, :type, :factory_id, :email, :password)
  end
end
