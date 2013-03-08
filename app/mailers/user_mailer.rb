class UserMailer < ActionMailer::Base
  helper :application
  default from: "your@shopping.list"

  def email_shopping_list(current_user, sorted_list, list_id)
    @sorted_list = sorted_list
    @current_user = current_user
    @list = ShoppingList.find(list_id)
    mail(to: @current_user.email,
      subject: "Shopping List")
  end
end
