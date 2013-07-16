class Region < ActiveRecord::Base
  attr_accessible :active, :aliasname, :name
  has_many :deal
end
