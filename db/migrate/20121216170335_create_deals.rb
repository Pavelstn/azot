class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :type_id
      t.integer :category_id
      t.integer :region_id
      t.integer :partner_id
      t.integer :user_id
      t.boolean :active, :default => false
      t.boolean :isdelete, :default => false
      t.boolean :top, :default => false
      t.string :title
      t.string :shortdescription
      t.text :description
      t.string :imgurl, :limit=>2048
      t.string :smallimgurl, :limit=>2048
      t.float :costs, :default => 0
      t.string :url, :limit=>2048
      t.string :shorturl, :limit=>2048
      t.integer :click, :default => 0
      t.integer :visit, :default => 0
      t.datetime :start_action
      t.datetime :stop_action

      t.timestamps
    end
  end
end
