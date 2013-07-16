class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :type_id
      t.boolean :active
      t.integer :order
      t.string :name
      t.string :aliasname

      t.timestamps
    end
  end
end
