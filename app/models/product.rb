class Product < ActiveRecord::Base
  attr_accessible :name, :brand, :description
  has_many :store_products
  has_many :stores, through: :store_products

  validates :name, presence: true
end
