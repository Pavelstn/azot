class Type < ActiveRecord::Base
  attr_accessible :active, :aliasname, :name, :order
  has_many :category
  has_many :deal
end
