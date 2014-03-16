class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end
end
