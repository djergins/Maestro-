class AddPieceToParts < ActiveRecord::Migration
  def change
    add_column :parts, :piece, :string
  end
end
