class UserProductsController < ApplicationController
  def index
    @list = user_product_list(current_user)
  end


  def update
    user_product = UserProduct.find(params[:id])
    if user_product.update_attributes(params[:user_product])
      user_product.destroy if user_product.quantity == 0
      if request.xhr?
        render 'shared/_sidebar', layout: false
      else
        redirect_to :back
      end
    else
      render nothing: true, status: 500
    end
  end

  # handles all creation and incrementing-by-one of user_products
  def increment
    if user_product = UserProduct.where(product_id: params[:product_id],
        shopping_list_id: session[:current_list_id]).first
      user_product.quantity += 1
    else
      user_product = UserProduct.new(product_id: params[:product_id],
          shopping_list_id: session[:current_list_id],
          user_id: current_user.id)
    end
    if user_product.save
      if request.xhr?
        render 'shared/_sidebar', layout: false
      else
        redirect_to :back
      end
    else
      flash[:notice] = "Problem saving product"
      render nothing: true, status: 500
    end
  end

end