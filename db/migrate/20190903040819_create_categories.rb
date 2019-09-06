class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :parent_id, default: 0
      t.integer :order, default: 0
      t.text :description
      t.string :slug, null: false

      t.timestamps
    end
    add_index :categories, :slug
  end
end
