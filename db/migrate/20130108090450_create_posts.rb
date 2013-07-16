class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :deal_id
      t.integer :bot_id
      t.integer :typepost

      t.timestamps
    end
  end
end
