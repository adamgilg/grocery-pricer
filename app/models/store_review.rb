class StoreReview < ActiveRecord::Base
  attr_accessible :store_id, :user_id, :body, :rating

  belongs_to :store
  belongs_to :user
end
