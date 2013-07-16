class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.boolean :active
      t.integer :order
      t.string :name
      t.string :aliasname

      t.timestamps
    end
  end
end
