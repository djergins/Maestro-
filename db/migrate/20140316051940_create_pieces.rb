class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :composer
      t.string :arranger
      t.integer :library_number
      t.string :key
      t.integer :grade

      t.timestamps
    end
  end
end
