class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :aliasname
      t.boolean :active, :default => 0

      t.timestamps
    end
  end
end
