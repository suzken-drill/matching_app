class AdminPost < ApplicationRecord
  belongs_to :admin_user
  belongs_to :shop

  # constant
  STATUS_DATA = ["published", "draft", "private", "future"]
  POST_TYPE_DATA = ["post", "review"]
  INDEX_POST_NUM = 5
  INDEX_REVIEW_NUM = 5

  validates :title, presence: {message: I18n.t(:title_blank_error, scope: [:message, :admin_post])}, length: {maximum: 255, message: I18n.t(:title_length_error, scope: [:message, :admin_post])}
  validates :content, presence: {message: I18n.t(:content_blank_error, scopr: [:message, :admin_post])}, length: {maximum: 20000, message: I18n.t(:content_length_error, scope: [:message, :admin_post])}
  validates :excerpt, presence: {message: I18n.t(:excerpt_blank_error, scope: [:message, :admin_post])}, length: {maximum: 255, message: I18n.t(:excerpt_length_error, scope: [:message, :admin_post])}
  validates :status, inclusion: {in: STATUS_DATA, message: I18n.t(:status_choice_error, scope: [:message, :admin_post])}
  validates :post_type, inclusion: {in: POST_TYPE_DATA, message: I18n.t(:post_type_choice_error, scope: [:message, :admin_post])}

  def self.posts
    self.where(post_type: "post").where(status: "published").order(created_at: :desc)
  end
  def self.reviews
    self.where(post_type: "review").where(status: "published").order(created_at: :desc)
  end

end
