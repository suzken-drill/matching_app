class CreateShopContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_contacts do |t|
      t.string :shop_name, null: false
      t.string :person_name, null: false
      t.string :email, null: false
      t.text :message, null: false
      t.string :user_ip, null: false

      t.timestamps
    end
  end
end
