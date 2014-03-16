class RemoveTotalPiecesFromLibraries < ActiveRecord::Migration
  def change
    remove_column :libraries, :total_pieces, :integer
  end
end
