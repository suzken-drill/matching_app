class ShopReviewEval < ApplicationRecord
  belongs_to :shop_review

  validates :eval_key, presence: {message: I18n.t(:eval_key_blank_error, scope: [:message, :shop_review_eval])}
  validates :eval_value, presence: {message: I18n.t(:eval_value_blank_error, scope: [:message, :shop_review_eval])}, inclusion: {in: %w(0 1), message: I18n.t(:eval_value_choice_error, scope: [:message, :shop_review_eval])}
end
