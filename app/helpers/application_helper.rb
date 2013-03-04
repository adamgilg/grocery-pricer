module ApplicationHelper
  def format_price(value)
    cents = value % 100
    cents = "0#{cents}" if cents < 10
    dollars = value / 100
    "$#{dollars}.#{cents}"
  end

  def location_and_price(store_prod)
    "#{store_prod.store.name} (#{store_prod.store.address}) | #{format_price(store_prod.price)}"
  end

  #adds to current_user's shopping list (creates new or increments by one)
  def add_to_list(product)
    button_to("Add to shopping list",
      increment_user_product_path(product_id: product.id),
      method: :post,
      remote: true)
  end

  def total_list_price(user)

  end

  def sort_list_by_store(user)
    products_by_store = {}
    ups = user.user_products.joins(:store_product).order(store_products: :store_id)
    ups.each do |up|
      if products_by_store[up.store_product.store_id]
        products_by_store[up.store_product.store_id] << up
      else
        products_by_store[up.store_product.store_id] = [up]
      end
    end
    products_by_store
  end

  def email_shopping_list
    button_to("Email list",
      email_shopping_list_users_path,
      remote: true,
      method: :post)
  end
end
