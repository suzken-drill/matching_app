class CreateCategoryRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :category_relationships do |t|
      t.references :category, foreign_key: true
      t.references :shop, foreign_key: true
      t.integer :order, default: 0

      t.timestamps
    end
  end
end
