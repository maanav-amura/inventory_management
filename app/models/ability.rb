#
# Class Ability provides ability and authozization for managers and buyers
#
# @author Maanav Shah <maanav@amuratech.com>
#
class Ability
  include CanCan::Ability

  #
  # defines the ability for users and admins
  #
  # @param [<type>] user <description>
  #
  def initialize(user)
    user ||= User.new
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.is_a?(User::Manager)
      can :manage, :all
      cannot :purchase, Product
      cannot :confirm, Product
      cannot :purchase_confirm, Product
      cannot :create, InvoiceBill
    else
      can :purchase, Product
      can :confirm, Product
      can :purchase_confirm, Product
      can :create, InvoiceBill
    end
    can :read, InvoiceBill
    cannot :update, InvoiceBill
    cannot :destroy, InvoiceBill
  end
end
