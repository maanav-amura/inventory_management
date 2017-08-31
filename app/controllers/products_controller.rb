class ProductsController < ApplicationController
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
    p @product
    if @product.update_attributes(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to(products_url)
    else
      flash[:notice] = @product.errors.full_messages.join(', ') if @product.errors.any?
      render('edit')
    end
  end

  def delete
    @product = Product.where(id: params[:id]).first
  end

  def destroy
    @product = Product.where(id: params[:id]).first
    if @product.destroy
      flash[:notice] = 'Product successfully deleted!'
      redirect_to(:action => 'index')
    else
      render('delete')
    end
  end

  def purchase
    @products = Product.available_products
    puts current_user.id, current_user.name
  end

  def confirm
    @product = Product.where(id: params[:id]).first
  end

  def buy
    @bill = InvoiceBill.new
    @bill.user_id = current_user.id
    @bill.total_price = Product.where(id: params[:id]).first.price
    @bill.save
    @bill.invoice_details << InvoiceDetail.new(product_id: params[:id])
    redirect_to '/products/purchase'
  end

  private
    def product_params
      params.require(:product).permit(:name,:price,:capacity,:available,:factory_id)
    end

end
