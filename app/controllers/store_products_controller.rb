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
    else
      flash[:alert]
    end
    # WORKING ON THIS - NEED TO RENDER TWO DIFFERENT THINGS FOR PRODUCT/STORE VIEWS
    # pass in info in query string
    if request.xhr? && params[:location] == "store_show"
      render "stores/_product_list",
        locals: { store: @store_product.store },
        layout: false
    elsif request.xhr? && params[:location] == "product_show"
      render "products/_stores_list",
        locals: { product: @store_product.product },
        layout: false
    else
      redirect_to :back
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