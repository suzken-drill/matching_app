class CreateShopPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_payments do |t|
      t.references :shop, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
