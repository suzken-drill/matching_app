class Payment < ApplicationRecord
  has_many :shop_payments
  has_many :shops, through: :shop_payments

  validates :name, presence: {message: I18n.t(:name_blank_error, scope: [:message, :payment])}
end
