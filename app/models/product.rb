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
    self.store_products.average('price').to_i
  end

#this should live somewhere else - doesn't make sense to base it on price
  def convert_price(value)
    cents = value % 100
    dollars = value / 100
    "$#{dollars}.#{cents}"
  end

  def name_and_brand
    "#{self.name} | #{self.brand}"
  end
end
