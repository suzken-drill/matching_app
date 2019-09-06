class ShopReviewLike < ApplicationRecord
  belongs_to :shop_review
  belongs_to :user
end
