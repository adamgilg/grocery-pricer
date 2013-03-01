class UserProductsController < ApplicationController
  def index
    @list = user_product_list(current_user)

    # respond_to do |format|
    #   format.html
    #   format.json { render json: @list }
    # end
  end

  def create
    product = Product.find(params[:product_id])
    user_product = UserProduct.new(product_id: product.id, user_id: current_user.id)
    user_product.quantity = 1
    if user_product.save
      if request.xhr?
        render 'shared/_list', layout: false
      else
        redirect_to :back
      end
    else
      render nothing: true, status: 500
    end
  end

  def update
    user_product = UserProduct.where(product_id: params[:product_id], user_id: current_user).first
    p user_product
    user_product.quantity += params[:change].to_i
    if user_product.save
      if request.xhr?
        render 'shared/_list', layout: false
      else
        redirect_to :back
      end
    else
      render nothing: true, status: 500
    end
  end

  def destroy
    user_product = UserProduct.find(params[:id])
    if user_product.destroy
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