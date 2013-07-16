class StatController < ApplicationController
	load_and_authorize_resource 
	layout "admin"
  def index
  	@stats=Stat.getpopular_loadpage
  	 @all_deal= Deal.where("isdelete!=1 AND active=1").count()
  	 @sum= Stat.getpopular_loadpage_sum
     @click= Stat.click_sum
  end

  def destroy_all
    Stat.delete_all()
    redirect_to stat_url 
  end


end
