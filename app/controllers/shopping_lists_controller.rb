class ShoppingListsController < ApplicationController
  def create
    shopping_list = ShoppingList.new(user_id: params[:user_id])
    if shopping_list.save
      # do something js-ey
    else
      flash[:alert] = "Problem saving shopping list"
    end
  end

  def update
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.update_attributes(params[:shopping_list])
      if request.xhr?
        # what if the request comes from a different section of the app?
        render 'shared/_sidebar', layout: false
      else
        redirect_to :back
      end
    else
      flash[:alert] = "Problem! Title not updated"
      render nothing: true, status: 500
    end
  end

  def change_current_list
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    session[:current_list_id] = shopping_list.id
    if request.xhr?
      render 'shared/_sidebar', layout: false
    else
      redirect_to :back
    end
  end
end