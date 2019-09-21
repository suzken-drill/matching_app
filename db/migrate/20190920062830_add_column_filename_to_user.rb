class AddColumnFilenameToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :filename, :string
  end
end
