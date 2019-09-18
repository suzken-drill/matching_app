class AddColumnHeadlineToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :headline, :string, null: false, after: :url
  end
end
