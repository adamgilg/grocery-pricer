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
      redirect_to products_path
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

  def remove_from_list
    if UserProduct.where(product_id: params[:id], user_id: current_user.id).destroy_all
      if request.xhr?
        render "shared/_list", layout: false
      else
        redirect_to :back
      end
    else
      render nothing: true, status: 500
    end
  end
end