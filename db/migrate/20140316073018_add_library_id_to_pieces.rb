class AddLibraryIdToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :library_id, :integer
    add_index :pieces, :library_id
  end
end
