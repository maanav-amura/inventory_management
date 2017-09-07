class ProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @products = Product.all_products
  end

  def show
    @product = Product.where(id: params[:id]).first
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product successfully created!'
      redirect_to(action: 'index')
    else
      flash[:notice] = @product.errors.full_messages.join(', ') if @product.errors.any?
      render('new')
    end
  end

  def edit
    @product = Product.where(id: params[:id]).first
  end

  def update
    @product = Product.where(id: params[:id]).first
    if @product.update_attributes(product_params)
      flash[:notice] = 'Product successfully updated!'
      redirect_to(products_url)
    else
      if @product.errors.any?
        flash[:notice] = @product.errors.full_messages.join(', ')
      end
      render('edit')
    end
  end

  def destroy
    @product = Product.where(id: params[:id]).first
    if @product.destroy
      flash[:notice] = 'Product successfully deleted!'
      redirect_to action: 'index'
    end
  end

  def purchase
    @products = Product.available_products
  end

  def confirm
    @product = Product.where(id: params[:id]).first
  end

  def purchase_confirm
    @bill = InvoiceBill.new
    @bill.user_id = current_user.id
    invoice_quantity = params[:invoice_detail]['quantity'].to_i
    @product = Product.where(id: params[:id]).first
    @bill.total_price = @product.price * invoice_quantity
    if customer? && invoice_quantity.to_i > 10
      flash[:notice] = 'Quantity must be less than 10 for user!'
    elsif (shopkeeper? || vendor?) && (invoice_quantity % 10) != 0
      flash[:notice] = 'Quantity must be a multiple of 10!'
    elsif @product.capacity < invoice_quantity
      flash[:notice] = 'Product quantity not available'
    else
      @bill.save
      @bill.invoice_details << InvoiceDetail.new(product_id: params[:id], quantity: invoice_quantity)
      @product.capacity -= invoice_quantity
      @product.save
      flash[:notice] = 'Invoice Generated!'
    end
    redirect_to '/products/purchase'
  end

  private

    def product_params
      params.require(:product).permit(:name,:price,:capacity,:available,:factory_id)
    end
end
