class AddTotalPiecesToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :total_pieces, :integer
  end
end
