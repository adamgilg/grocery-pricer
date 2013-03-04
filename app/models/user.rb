class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  has_many :product_reviews
  has_many :store_reviews
  has_many :shopping_lists
  has_many :user_products
  has_many :products, through: :user_products
end
