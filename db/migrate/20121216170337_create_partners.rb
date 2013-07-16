class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.boolean :active, :default => 0
      t.string :name
      t.string :aliasname
      t.string :partnercode, :limit=>2048
      t.string :partnersite, :limit=>2048
      t.text :banner

      t.timestamps
    end
  end
end
