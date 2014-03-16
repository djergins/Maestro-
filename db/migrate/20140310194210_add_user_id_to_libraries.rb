class AddUserIdToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :user_id:integer
  end
  add_index :libraries, [:user_id]
end
