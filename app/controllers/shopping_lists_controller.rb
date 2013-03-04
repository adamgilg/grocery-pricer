class ShoppingListController < ApplicationController
  def create
    shopping_list = ShoppingList.new(user_id: params[:user_id])
    if shopping_list.save
      # do something js-ey
    else
      flash[:alert] = "Problem saving shopping list"
    end
  end
end