class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
     @product = Product.new(params_product)

      if @product.save
       redirect_to products_path
      else
      render :new
      end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params_product)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def params_product
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
