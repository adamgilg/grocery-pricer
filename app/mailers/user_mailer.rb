class UserMailer < ActionMailer::Base
  helper :application
  default from: "your@shopping.list"

  def email_shopping_list(current_user, sorted_list)
    @sorted_list = sorted_list
    @current_user = current_user
    mail(to: @current_user.email,
      subject: "Shopping List")
  end
end
