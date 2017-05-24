class AddIndexUsersOnConfirmationToken < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    add_index :users, :confirmation_token, unique: true, using: :btree
  end
end
