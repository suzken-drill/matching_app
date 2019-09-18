class ChangeColumnToAdminPost < ActiveRecord::Migration[5.2]
  def up
    change_column :admin_posts, :status, :string, null: false, default: "draft"
    change_column :admin_posts, :post_type, :string, null: false, default: "post"
  end
  def down
    change_column :admin_posts, :status, :string, null: false, default: "post"
    change_column :admin_posts, :post_type, :string, null: false, default: "draft"
  end
end
