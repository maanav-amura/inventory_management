class ProductsController < ApplicationController
  def index
    @products = Product.all
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

  private
    def product_params
      params.require(:product).permit(:name,:price,:capacity,:available,:factory_id)
    end

end
