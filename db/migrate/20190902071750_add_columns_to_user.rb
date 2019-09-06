class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nick_name, :string
    add_column :users, :introduction, :text
  end
end
