class Store < ActiveRecord::Base
  attr_accessible :name, :address, :phone_number, :description
  has_many :store_products
  has_many :products, through: :store_products
  has_many :user_products, through: :store_products

  has_many :reviews, class_name: "StoreReview"

  validates :name, presence: true
  validates :address, presence: true

  validates :name, uniqueness: { scope: :address }

  def average_rating
    self.reviews.average('rating').to_f
  end

end
