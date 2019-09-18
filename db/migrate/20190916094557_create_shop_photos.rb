class CreateShopPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_photos do |t|
      t.references :shop, foreign_key: true
      t.string :filename, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
