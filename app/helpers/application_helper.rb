module ApplicationHelper
  def format_price(value)
    cents = value % 100
    cents = "0#{cents}" if cents < 10
    dollars = value / 100
    "$#{dollars}.#{cents}"
  end

  # def user_products_count(user)
  #   product_counts = {}
  #   user.products.all.each do |prod|
  #     if product_counts[prod]
  #       product_counts[prod] += 1
  #     else
  #       product_counts[prod] = 1
  #     end
  #   end
  #   return product_counts
  # end

  #adds to current_user's shopping list
  def add_to_list(product)
    button_to("Add to shopping list",
      user_products_path(product_id: product.id),
      method: :post,
      remote: true)
  end

  def change_item_quantity(product, change, btn_text)
    button_to(btn_text,
      user_product_path(product_id: product.id, change: change),
      remote: true,
      method: :put)
  end

  #removes single instance of an item from current_user's shopping list
  def remove_one_from_list_btn(product)
    user_product = UserProduct.where(product_id: product.id, user_id: current_user.id).last
    button_to("Remove one",
      user_product_path(user_product.id),
      method: :delete,
      remote: true,
      form_class: "btn remove-from-list-btn")
  end

  #removes all of one user's item from shopping list
  def remove_all_btn(product)
    button_to("Remove all",
      remove_from_list_product_path(product),
      method: :delete,
      remote: true,
      form_class: "btn remove-all-from-list-btn")
  end
end
