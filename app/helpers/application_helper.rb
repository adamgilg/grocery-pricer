module ApplicationHelper
  def format_price(value)
    cents = value % 100
    cents = "0#{cents}" if cents < 10
    dollars = value / 100
    "$#{dollars}.#{cents}"
  end

  def user_products_count(user)
    product_counts = {}
    user.products.each do |prod|
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
      remote: true
    )
  end
end
