class AddColumnAddToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :address, :string, null: false, after: :owner_tel
    add_column :owners, :biz_hour, :string, null: false, after: :address
    add_column :owners, :delivery, :string, null: false, after: :biz_hour
    add_column :owners, :support, :string, null: false, after: :delivery
    add_column :owners, :carrier, :string, null: false, after: :support
  end
end
