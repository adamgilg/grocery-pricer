class ProductReview < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :body, :rating

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :product_id, uniqueness: { scope: :user_id }
  validates_inclusion_of :rating, in: 1..7

  belongs_to :user
  belongs_to :product
end
