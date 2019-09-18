class AddColumnSnsToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :twitter, :string, null: false, after: :description
    add_column :shops, :blog, :string, null: false, after: :twitter
    add_column :shops, :youtube, :string, null: false, after: :blog
    add_column :shops, :saleinfo, :string, null: false, after: :youtube
  end
end
