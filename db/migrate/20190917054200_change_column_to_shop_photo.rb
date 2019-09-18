class ChangeColumnToShopPhoto < ActiveRecord::Migration[5.2]
  def up
	rename_column :shop_photos, :type, :photo_type
	change_column :shop_photos, :photo_type, :string, null: false, default: "sub"
  end
  def down
	rename_column :shop_photos, :photo_type, :type
	change_column :shop_photos, :type, null: false
  end
end
