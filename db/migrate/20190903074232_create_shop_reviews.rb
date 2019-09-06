class CreateShopReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_reviews do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :item_name, null: false
      t.text :description
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
