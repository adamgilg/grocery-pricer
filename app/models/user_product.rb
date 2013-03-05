class UserProduct < ActiveRecord::Base
  attr_accessible :user_id, :product_id, :quantity, :store_product_id, :shopping_list_id

  belongs_to :user
  belongs_to :product
  belongs_to :store_product
  belongs_to :shopping_list
  has_one :store, through: :store_product

  validates :shopping_list_id, presence: true
  # validates :user, presence: true
  validates :product_id, presence: true
  validates :product_id, uniqueness: { scope: :shopping_list_id }
end