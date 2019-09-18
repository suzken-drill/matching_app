class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name, null: false
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
