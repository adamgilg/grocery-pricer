class Product < ActiveRecord::Base
  attr_accessible :name, :brand, :description
  has_many :store_products
  has_many :stores, through: :store_products
  has_many :reviews, class_name: "ProductReview"
  has_many :user_products
  has_many :users, through: :user_products

  validates :name, presence: true

  def average_rating
    self.reviews.average('rating').to_f
  end

  def average_price
    self.store_products.average('price').to_i
  end


  def name_and_brand
    "#{self.name} | #{self.brand}"
  end
end
