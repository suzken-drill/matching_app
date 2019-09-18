class Shop < ApplicationRecord
  belongs_to :owner
  has_many :shop_reviews
  has_many :shop_likes
  has_one :category_relationship, dependent: :destroy
  has_one :category, through: :category_relationship
  has_many :shop_photos, dependent: :destroy
  has_many :shop_payments, dependent: :destroy
  has_many :payment, through: :shop_payments

  accepts_nested_attributes_for :category_relationship
  accepts_nested_attributes_for :shop_photos, allow_destroy: true, limit: 10
  accepts_nested_attributes_for :shop_payments, allow_destroy: true

  # constant
  SHOW_PHOTO_NUM = 8
  SHOW_REVIEW_NUM = 5
  REGISTRABLE_ATTRIBUTES = %i(name url description headline twitter blog youtube saleinfo)

  validates :name, presence: {message: I18n.t(:name_blank_error, scope: [:message, :shop])}
  validates :url, presence: {message: I18n.t(:url_blank_error, scope: [:message, :shop])}, format: {with:  /http(s|):\/\/[\w\-\_\.\!\*\'\)\(]+/, message: I18n.t(:url_format_error, scope: [:message, :shop])}
  validates :description, presence: {message: I18n.t(:description_blank_error, scope: [:message, :shop])}
  validates :headline, presence: {message: I18n.t(:headline_blank_error, scope: [:message, :shop])}, length: {maximum: 255, message: I18n.t(:headline_length_error, scope: [:message, :shop])}

  scope :shop_set, -> { includes(:owner, :category, shop_reviews: [:shop_review_evals, :shop_review_photos]) }

  def self.shop_sort(category, order_type)
  	#.where(id: category.category_relationships.pluck(:id))
    # 更新日時順
   	#.order(created_at: :desc) if order_type == :created_at
   	# 人気順
    #.includes(:shop_likes).select("count(id) as like_num").order("like_num DESC") if order_type == :popularity
    # 口コミ数順
    #SELECT a.*, count(b.id) as review_num FROM shops a LEFT OUTER JOIN shop_reviews b ON a.id = b.shop_id group by b.
    #.includes
    # 標準

  end
  def eval_point
    self.shop_reviews.count > 0 ? ShopReviewEval.where(shop_review_id: self.shop_reviews.pluck(:id), eval_value: 1).count : 0
  end
  def total_photo_count
    self.shop_reviews.count > 0 ? ShopReviewPhoto.where(shop_review_id: self.shop_reviews.pluck(:id)).count : 0
  end
  # ショップに投稿されたレビューの写真全件
  def total_photos
  	shop_review_ids = self.shop_reviews.pluck(:id)
    total_photos = ShopReviewPhoto.where(shop_review_id: shop_review_ids).order(created_at: :desc)
  end
  def category_to_array
    category_array = []
    if self.category.is_original?
      category_array << {url: "#{Pathname.new('/').join(self.category.slug)}", text: self.category.name}
    else
      parent_cat = Category.where(id: self.category.parent_id).first
      category_array << {url: "#{Pathname.new('/').join(parent_cat.slug)}", text: parent_cat.name}
      category_array << {url: "#{Pathname.new('/').join(parent_cat.slug).join(self.category.slug)}", text: self.category.name}
    end
    return category_array
  end
end
