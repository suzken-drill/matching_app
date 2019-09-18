class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.references :owner, foreign_key: true
      t.string :name, null: false
      t.string :url, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
