class ChangeColumnToCategory < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :parent_id, :integer
  	add_reference :categories, :parent, after: :name, default: 0
  end
end
