class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  mount_uploader :filename, UsersUploader

  has_many :shop_reviews
  has_many :shop_likes
  has_many :shop_review_likes
  # フォロー
  has_many :active_relationships, class_name: "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  # フォロワー
  has_many :passive_relationships, class_name: "UserRelationship", foreign_key: "followed_id",dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # constant
  REVIEW_PER_PAGE = 10
  REGISTRABLE_ATTRIBUTES = %i(email filename nick_name introduction password password_confirmation)

  validates :nick_name, presence: {message: I18n.t(attribute: :nick_name, message: :blank)}, on: :profile
  validates :introduction, presence: {message: I18n.t(attribute: :introduction, message: :blank)}, on: :profile

  def total_photo_count
  	ShopReviewPhoto.where(shop_review_id: self.shop_reviews.pluck(:id)).count
  end
  def follow(other_user)
  	following << other_user
  end
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  def following?(other_user)
    following.include?(other_user)
  end
  def self.active(id)
    where(id: id).where.not(confirmed_at: nil).first
  end

end
