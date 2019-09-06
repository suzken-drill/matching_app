class Category < ApplicationRecord
  has_many :category_relationships
  has_many :shops, through: :category_relationships
  has_many :sub_categories, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent_category, class_name: "Category", foreign_key: "parent_id", optional: true

  validates :name, presence: {message: I18n.t(:name_blank_error, scope: [:message, :category])}
  validates :slug, presence: {message: I18n.t(:slug_blank_error, scope: [:message, :categpry])}

  ORIGINAL_PARENT_ID = 0

  def is_original?
  	self.parent_id == ORIGINAL_PARENT_ID
  end
  def is_sub?
    self.parent_id != ORIGINAL_PARENT_ID
  end
  def self.originals
    self.where(parent_id: ORIGINAL_PARENT_ID).order(order: :desc)
  end
end
