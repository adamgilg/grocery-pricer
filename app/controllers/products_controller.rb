class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Product successfully saved"
      redirect_to products_path
    else
      flash[:alert] = "Problem saving product"
      render 'new'
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new_product_store_product
  end
end