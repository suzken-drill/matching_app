class ShopReview < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :shop_review_evals
  has_many :shop_review_photos
  has_many :shop_review_likes

  validates :item_name, presence: {message: I18n.t(:item_name_blank_error, scope: [:message, :shop_review])}

end
