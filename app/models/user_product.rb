class UserProduct < ActiveRecord::Base
  attr_accessible :user_id, :product_id, :quantity, :store_product_id

  belongs_to :user
  belongs_to :product
  belongs_to :store_product
  has_one :store, through: :store_product

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :product_id, uniqueness: { scope: :user_id }
end