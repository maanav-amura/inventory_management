class ProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @products = Product.all_products
    respond_to do |format|
      format.json { render json: @products }
      format.html { render 'index' }
    end
  end

  def show
    @product = Product.where(id: params[:id]).first
    respond_to do |format|
      format.json { render json: @product }
      format.html
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save

      flash[:notice] = 'Product successfully created!'
      respond_to do |format|
      format.json { render json: @product }
      format.html { render 'index' }
    end
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
      respond_to do |format|
        format.json { render json: @product }
        format.html { redirect_to(products_url) }
      end
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
      respond_to do |format|
        format.json { render json: 'deleted' }
        format.html
      end
    end
  end

  def purchase
    @products = Product.available_products
      respond_to do |format|
      format.json { render json: @products }
      format.html { render 'purchase' }
    end

  end

  def confirm
    @product = Product.where(id: params[:id]).first
    respond_to do |format|
      format.json { render json: @product }
      format.html { render 'confirm' }
    end
  end

  def purchase_confirm
    @bill = InvoiceBill.new
    @bill.user_id = current_user.id
    @quantity = params[:product_detail]['quantity'].to_i
    @product = Product.where(id: params[:id]).first
    @bill.total_price = @product.price * @quantity
    if customer? && @quantity.to_i > 10
      flash[:notice] = 'Quantity must be less than 10 for user!'
    elsif (shopkeeper? || vendor?) && (@quantity % 10) != 0
      flash[:notice] = 'Quantity must be a multiple of 10!'
    elsif @product.capacity < @quantity
      flash[:notice] = 'Product quantity not available'
    else
      @bill.save
      @bill.product_details << ProductDetail.new(product_id: @product.id, name: @product.name,quantity: @quantity)
      @product.capacity -= @quantity
      @product.save
      flash[:notice] = 'Invoice Generated!'
    end
    respond_to do |format|
      format.json { render json: @product }
      format.html { render '/products/purchase' }
    end
  end

  def search()
    respond_to do |format|
      @products = Product.where( { name: /^#{params['search']}/ } )
      format.json { render json: @products }
      format.html { 'index' }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name,:price,:capacity,:available,:factory_id)
  end
end
