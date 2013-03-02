class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def email_shopping_list
    UserMailer.email_shopping_list(current_user, sort_list_by_store(@current_user)).deliver
    render nothing: true
  end
end