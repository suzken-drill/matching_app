class ShopPayment < ApplicationRecord
  belongs_to :shop
  belongs_to :payment

  # constant
  # REGISTRABLE_ATTRIBUTES = %i(payment_id: [])

  validates :payment_id, presence: {message: I18n.t(:payment_id_blank_error, scope: [:message, :shop_payment])}

end
