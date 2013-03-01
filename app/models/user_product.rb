class UserProduct < ActiveRecord::Base
  attr_accessible :user_id, :product_id, :store_id, :quantity

  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :product_id, uniqueness: { scope: :user_id }
end