class AddLibraryIdToPart < ActiveRecord::Migration
  def change
    add_column :parts, :library_id, :integer
  end
end
