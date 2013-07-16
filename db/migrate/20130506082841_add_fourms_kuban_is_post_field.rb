class AddFourmsKubanIsPostField < ActiveRecord::Migration
 def change
  	add_column :deals, :fkubankpost, :boolean, :default => 0
  end
end
