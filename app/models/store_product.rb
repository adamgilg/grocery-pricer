class StoreProduct < ActiveRecord::Base
  attr_accessible :product_id, :store_id, :price

  belongs_to :store
  belongs_to :product
  has_many :user_products

  validates :store_id, presence: true
  validates :product_id, presence: true
  validates :product_id, uniqueness: { scope: :store_id }
end