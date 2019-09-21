class ShopReviewEval < ApplicationRecord
  belongs_to :shop_review

  # constant
  EVAL_KEYS = ["usability", "support", "term", "wrapping", "merchandise"]
  EVAL_KEY_SET = {usability: "使い易さ", support: "サポート", term: "納期", wrapping: "梱包", merchandise: "商品"}
  EVAL_VALUES = (1..2).to_a
  EVAL_VALUE_SELECT = [["はい", 1], ["いいえ", 2]]
  REGISTRABLE_ATTRIBUTES = %i(id eval_key eval_value)

  validates :eval_key, presence: {message: I18n.t(:eval_key_blank_error, scope: [:message, :shop_review_eval])}, inclusion: {in: EVAL_KEYS, message: I18n.t(:eval_key_choice_error, scope: [:message, :shop_review_eval])}
  validates :eval_value, presence: {message: I18n.t(:eval_value_blank_error, scope: [:message, :shop_review_eval])}, inclusion: {in: EVAL_VALUES, message: I18n.t(:eval_value_choice_error, scope: [:message, :shop_review_eval])}

end
