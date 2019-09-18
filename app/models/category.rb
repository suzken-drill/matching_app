class Category < ApplicationRecord
  before_create :set_parent_id

  has_many :category_relationships
  has_many :shops, through: :category_relationships
  has_many :sub_categories, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent_category, class_name: "Category", foreign_key: "parent_id", optional: true

  ORIGINAL_PARENT_ID = 0

  validates :name, presence: {message: I18n.t(:name_blank_error, scope: [:message, :category])}
  validates :slug, presence: {message: I18n.t(:slug_blank_error, scope: [:message, :categpry])}
  validates :parent_id, presence: {message: I18n.t(:parent_id_blank_error, scope: [:message, :category])}

  def is_original?
  	self.parent_id == ORIGINAL_PARENT_ID
  end
  def is_sub?
    self.parent_id != ORIGINAL_PARENT_ID
  end
  def self.originals
    self.where(parent_id: ORIGINAL_PARENT_ID).order(order: :desc)
  end
  def sub_categories_shop_count
    category_ids = sub_categories.pluck(:id)
    CategoryRelationship.where(category_id: category_ids).count
  end

  private
    def set_parent_id
      self.parent_id = ORIGINAL_PARENT_ID if self.parent_id.blank?
    end

end
