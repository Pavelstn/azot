class Category < ActiveRecord::Base
  attr_accessible :active, :aliasname, :name, :order, :type_id,:parent_id
  belongs_to :type
  has_many :deal
  has_ancestry

  def self.active_only
    Category.where(:active=>1)
  end

end
