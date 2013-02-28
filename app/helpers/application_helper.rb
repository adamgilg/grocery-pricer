module ApplicationHelper
  def format_price(value)
    cents = value % 100
    cents = "0#{cents}" if cents < 10
    dollars = value / 100
    "$#{dollars}.#{cents}"
  end

  def user_products_count(user)
    product_counts = {}
    user.products.all.each do |prod|
      if product_counts[prod]
        product_counts[prod] += 1
      else
        product_counts[prod] = 1
      end
    end
    return product_counts
  end

  def add_to_list(product)
    button_to("Add to shopping list",
      user_products_path(product_id: product.id),
      method: :post,
      remote: true)
  end

  def remove_from_list(product)
    user_product = UserProduct.where(product_id: product.id, user_id: current_user.id).last
    button_to("Remove one",
      user_product_path(user_product.id),
      method: :delete,
      remote: true,
      form_class: "btn remove-from-list-btn")
  end

  def remove_all(product)
    #
  end
end
