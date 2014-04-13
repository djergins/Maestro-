class AddPieceIdToPart < ActiveRecord::Migration
  def change
    add_column :parts, :piece_id, :integer
  end
end
