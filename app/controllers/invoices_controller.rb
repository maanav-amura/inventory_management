class InvoicesController < ApplicationController
  def index
    @bills = InvoiceBill.all.where(user_id: current_user.id)
  end

  def show
    @bill = InvoiceBill.where(id: params[:id]).first
    @user = User.where(id: @bill.user_id).first.name
    @detail = InvoiceDetail.where(invoice_bill_id: params[:id]).first
    @quantity = @detail.quantity
    @product = Product.where(id: @detail.product_id).first
    @name = @product.name
    @price = @product.price.to_i * @detail.quantity.to_i
  end

end
