class InvoicesController < ApplicationController
  def index
    unless manager?
      @bills = InvoiceBill.all.where(user_id: current_user.id)
    else
      @bills = InvoiceBill.sort_by_price
      @products = @bills.map { |b| Product.find(InvoiceDetail.find_by_invoice_bill_id(b.id).product_id).name }
    end
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
