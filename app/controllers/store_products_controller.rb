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
end