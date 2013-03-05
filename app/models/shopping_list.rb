class ShoppingList < ActiveRecord::Base
  attr_accessible :user_id, :title, :notes

  validates :user_id, presence: true
  # has a default title at db level - necessary to validate?
  # validates :title, presence: true

  belongs_to :user
  has_many :user_products
  has_many :products, through: :user_products

  def self.find_most_recent(user)
    self.where(user_id: user.id).order("updated_at DESC").first
  end
end