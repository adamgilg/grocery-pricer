class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  validates :name, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  has_many :product_reviews
  has_many :store_reviews
end
