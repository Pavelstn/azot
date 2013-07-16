class Stat < ActiveRecord::Base
  attr_accessible :deal_id, :visittype
  belongs_to :deal

  def self.loadpage(deal_id)
    Stat.create(:deal_id=>deal_id, :visittype=>1)
  end

  def self.visitpage(deal_id)
    Stat.create(:deal_id=>deal_id, :visittype=>2)
  end

  def self.click(deal_id)
    Stat.create(:deal_id=>deal_id, :visittype=>3)
  end

  def self.getpopular_loadpage
    Stat.find(:all, :select => "deal_id, count(deal_id) AS visit",:group => "deal_id", :limit=>10, :order=>("visit DESC"))
 end

 def self.getpopular_loadpage_sum
    Stat.where(:visittype=>1).count
 end

 def self.click_sum
    Stat.where(:visittype=>3).count
 end
end
