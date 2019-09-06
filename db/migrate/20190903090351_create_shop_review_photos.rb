class CreateShopReviewPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_review_photos do |t|
      t.references :shop_review, foreign_key: true
      t.string :filename, null: false
      t.string :comment

      t.timestamps
    end
  end
end
