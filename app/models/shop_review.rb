class ShopReview < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :shop_review_evals, dependent: :destroy
  has_many :shop_review_photos, dependent: :destroy
  has_many :shop_review_likes, dependent: :destroy

  accepts_nested_attributes_for :shop_review_evals, allow_destroy: true
  accepts_nested_attributes_for :shop_review_photos, allow_destroy: true

  PER_PAGE = 20
  INDEX_REVIEW_NUM = 5
  REGISTRABLE_ATTRIBUTES = %i(id shop_id item_name description purchased_at)

  validates :item_name, presence: {message: I18n.t(:item_name_blank_error, scope: [:message, :shop_review])}
  validates :description, presence: {message: I18n.t(:description_blank_error, scope: [:message, :shop_review])}
  validates :purchased_at, presence: {message: I18n.t(:purchased_at_blank_error, scope: [:message, :shop_review])}

  default_scope { order(created_at: :desc) }

  def eval_value_count
    shop_review_evals.where(eval_value: 1).count
  end
  def already_liked?(user)
    shop_review_likes.find_by(user_id: user.id).present?
  end
end
