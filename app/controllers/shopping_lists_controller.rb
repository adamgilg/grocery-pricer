class ShoppingListsController < ApplicationController
  def create
    shopping_list = ShoppingList.new(user_id: params[:user_id])
    if shopping_list.save
      flash[:notice] = "New shopping list!"
      session[:current_list_id] = shopping_list.id
      if request.xhr?
        render 'shared/_sidebar', layout: false
      else
        redirect_to :back
      end
    else
      flash[:alert] = "Problem saving shopping list"
    end
  end

  def update
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.update_attributes(params[:shopping_list])
      if request.xhr?
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

  def destroy
    shopping_list = ShoppingList.find(params[:id])
    if shopping_list.destroy
      flash[:notice] = "List deleted"
      redirect_to :back
    else
      flash[:alert] = "Problem deleting list"
    end
  end

  # to return total price formatted in json when store/quantity change
  # on user show page
  # def total_list_price
  #   price = format_price(total_list_price(session[:current_list_id]))
  # end
end