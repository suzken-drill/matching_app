class CreateAdminPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_posts do |t|
      t.references :admin_user, foreign_key: true
      t.references :shop, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.string :excerpt, null: false
      t.string :status, null: false, default: "post"
      t.string :post_type, null: false, default: "draft"

      t.timestamps
    end
  end
end
