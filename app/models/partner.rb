class Partner < ActiveRecord::Base
  attr_accessible :active, :aliasname, :banner, :name, :partnercode, :partnersite
  has_many :deal
end
