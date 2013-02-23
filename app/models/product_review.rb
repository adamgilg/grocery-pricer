class ProductReview < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :body, :rating

  belongs_to :user
  belongs_to :product
end
