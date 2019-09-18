class CreateShopReviewEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_review_evals do |t|
      t.references :shop_review, foreign_key: true
      t.string :eval_key, null: false
      t.integer :eval_value, null: false, default: 0

      t.timestamps
    end
  end
end
