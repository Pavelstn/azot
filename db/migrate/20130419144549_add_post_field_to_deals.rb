class AddPostFieldToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :vkpost, :boolean, :default => 0
  	add_column :deals, :twitterpost, :boolean, :default => 0
  end
end
