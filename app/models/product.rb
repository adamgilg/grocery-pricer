class Product < ActiveRecord::Base
  attr_accessible :name, :brand, :description
  has_many :store_products
  has_many :stores, through: :store_products
  has_many :reviews, class_name: "ProductReview"

  validates :name, presence: true

  def average_rating
    self.reviews.average('rating').to_f
  end

  def average_price
    self.store_products.average('price')
  end

  def converted_price
    #convert price in cents to dollars & cents
  end
end
