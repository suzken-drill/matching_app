class CreateShopReviewLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_review_likes do |t|
      t.references :shop_review, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :shop_review_likes, [:shop_review_id, :user_id], unique: true
  end
end
