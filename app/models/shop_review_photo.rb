class ShopReviewPhoto < ApplicationRecord
  belongs_to :shop_review

  mount_uploader :filename, ShopReviewPhotoUploader

  REGISTRABLE_ATTRIBUTES = %i(id filename comment _destroy)

  validates :filename, presence: {message: I18n.t(:filename_blank_error, scope: [:message, :shop_review_photo])}
  validates :comment, length: {maximum: 255, message: I18n.t(:comment_length_error, scope: [:message, :shop_review_photo])}
end
