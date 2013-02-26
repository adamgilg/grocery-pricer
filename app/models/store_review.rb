class StoreReview < ActiveRecord::Base
  attr_accessible :store_id, :user_id, :body, :rating

  validates :store_id, presence: true
  validates :user_id, presence: true
  validates :store_id, uniqueness: { scope: :user_id }
  validates :rating, presence: true
  validates_inclusion_of :rating, in: 1..7

  belongs_to :store
  belongs_to :user
end
