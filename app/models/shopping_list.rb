class ShoppingList < ActiveRecord::Base
  attr_accessible :user_id, :title, :notes

  validates :user_id, presence: true
  # has a default title at db level - necessary to validate?
  # validates :title, presence: true

  belongs_to :user
  has_many :user_products

  def find_most_recent
    self.where(user_id: current_user.id).order("updated_at DESC").first
  end
end