class Store < ActiveRecord::Base
  attr_accessible :name, :address, :phone_number, :description
  has_many :store_products
  has_many :products, through: :store_products

  has_many :store_reviews

  validates :name, presence: true
  validates :address, presence: true

  validates :name, uniqueness: { scope: :address }

end
