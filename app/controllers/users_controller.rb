class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  # exact replication of s_l_controller change_current list with different render
  # so dumb
  def change_current_list
    shopping_list = ShoppingList.find(params[:shopping_list_id])
    session[:current_list_id] = shopping_list.id
    if request.xhr?
      render partial: "shopping_list", layout: false
    else
      redirect_to :back
    end
  end

  def email_shopping_list
    UserMailer.email_shopping_list(current_user, sort_list_by_store(@current_user)).deliver
    render nothing: true
  end
end