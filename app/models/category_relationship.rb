class CategoryRelationship < ApplicationRecord
  belongs_to :category
  belongs_to :shop

  REGISTRABLE_ATTRIBUTES = %i(category_id order)

  #validates :category_id, presence: {message: I18n.t(:category_id_blank_error, scope: [:message, :category_relationship])}
  #validates :shop_id, presence: {message: I18n.t(:shop_id_blank_error, scope: [:message, :category_relationship])}
end
