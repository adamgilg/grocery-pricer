class UserProductsController < ApplicationController
  def index
    @list = user_product_list(current_user)

    respond_to do |format|
      format.html
      format.json { render json: @list }
    end
  end

  def create
    product = Product.find(params[:product_id])
    user_product = UserProduct.new(product_id: product.id, user_id: current_user.id)
    if user_product.save
      render nothing: true, status: 200
    else
      render nothing: true, status: 500
    end
  end
end