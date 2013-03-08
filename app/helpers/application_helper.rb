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
      increment_user_products_path(product_id: product.id),
      method: :post,
      remote: true,
      class: "btn btn-success")
  end

  def total_list_price(list_id)
    list = ShoppingList.find(list_id)
    total = 0
    list.user_products.each do |up|
      if up.store_product
        total += (up.store_product.price * up.quantity)
      end
    end
    total
  end

  def sort_list_by_store
    products_by_store = {}
    list = ShoppingList.find(session[:current_list_id])
    ups = list.user_products.joins(:store_product).order("store_products.store_id DESC")
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
      method: :post,
      class: "btn btn-primary")
  end
end
