class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  before_filter :ensure_shopping_list_presence

  def ensure_shopping_list_presence
    if user_signed_in? && session[:current_list].blank?
      if current_user.shopping_lists.blank?
        new_list = ShoppingList.create(user_id: current_user.id)
        session[:current_list] = new_list
      else
        # uses most recently updated shopping list if user has one
        # may be problematic if user changes list on one page and doesn't add anything
        # then on next page will be set to a different list
        session[:current_list] = ShoppingList.find_most_recent
      end
    end
  end
end
