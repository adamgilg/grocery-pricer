class StoreProductsController < ApplicationController
  def new
    @store_product = StoreProduct.new
    @store_product.store_id = params[:store_id]
    @store_product.product_id = params[:product_id]
  end

  def create
    @store_product = StoreProduct.new(params[:store_product])
    if @store_product.save
      flash[:notice] = "store/product association successfully saved"
      redirect_to root_url
    else
      flash[:alert]
      render 'new'
    end
  end

  def update
    @store_product = StoreProduct.find(params[:id])
    if @store_product.availability
      @store_product.availability = false
    else
      @store_product.availability = true
    end
    if @store_product.save
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
  end
end