class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    @bills = manager? ? InvoiceBill.all : InvoiceBill.all.where(user_id: current_user.id)
  end

  def show
    @bill = InvoiceBill.where(id: params[:id]).first
    @user = User.where(id: @bill.user_id).first.name
    @detail = @bill.product_details.where(invoice_bill_id: params[:id]).first
  end
end
