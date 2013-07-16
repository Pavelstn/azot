class Deal < ActiveRecord::Base
  attr_accessible :active, :category_id, :click, :costs, :isdelete, :description, :imgurl, :partner_id, :region_id, :shortdescription, :shorturl, :smallimgurl, :start_action, :stop_action, :title, :top, :type_id, :url, :user_id, :visit, :vkpost, :fkubankpost
  belongs_to :type
  belongs_to :category
  belongs_to :partner
  belongs_to :region
  belongs_to :user
  belongs_to :stat
  has_many :stat

  def self.on_top
  		Deal.where("deals.top=1 AND deals.active=1 AND deals.isdelete=0")
  end

  def self.notdelete
  		Deal.where(:isdelete=>0)
  end

 def self.active_from_category(category_id)
  		Deal.where(:category_id=>category_id, :active=>1,:isdelete=>0)
 end

 def self.notdelete_from_category(category_id)
  		Deal.where(:category_id=>category_id,:isdelete=>0)
 end

 def self.destroy_all
      Deal.update_all("isdelete=1")
 end

 def self.all_active_not_vk_post(type_id)
      Deal.where(:type_id=>type_id ,:active=>1,:isdelete=>0, :vkpost=>0)
 end

  def self.all_active_not_twitter_post(type_id)
      Deal.where(:type_id=>type_id ,:active=>1,:isdelete=>0, :twitterpost=>0)
  end

  def self.all_active_not_fkuban_post(type_id, region_id)
    Deal.where(:type_id=>type_id, :region_id=>region_id ,:active=>1,:isdelete=>0, :fkubankpost=>0)
  end

end
