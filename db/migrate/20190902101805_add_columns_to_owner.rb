class AddColumnsToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :owner_name, :string
    add_column :owners, :owner_introduction, :text
    add_column :owners, :owner_tel, :string
  end
end
