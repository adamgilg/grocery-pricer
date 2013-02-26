module StoresHelper
  def average_rating(store)
    rated_store = Store.find(store.id)
    rated_store.store_reviews.average('rating').to_f
  end
end