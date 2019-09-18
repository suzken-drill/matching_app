class CreateUserRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_relationships do |t|
      t.references :follower
      t.references :followed

      t.timestamps
    end
    add_foreign_key :user_relationships, :users, column: :follower_id
    add_foreign_key :user_relationships, :users, column: :followed_id
    add_index :user_relationships, [:follower_id, :followed_id], unique: true
  end
end
