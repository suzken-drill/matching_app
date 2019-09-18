class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :shop_reviews
  has_many :shop_likes
  # フォロー
  has_many :active_relationships, class_name: "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  # フォロワー
  has_many :passive_relationships, class_name: "UserRelationship", foreign_key: "followed_id",dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  # constant
  REVIEW_PER_PAGE = 10

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

end
