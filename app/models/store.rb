class Store < ActiveRecord::Base
  attr_accessible :name, :address, :phone_number, :description
  has_many :store_products
  has_many :products, through: :store_products
end
