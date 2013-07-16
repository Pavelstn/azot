class UserapiController < ApplicationController
	def getrandomforvk
		begin
			@deals = Deal.all_active_not_vk_post(params[:id]).sample(1).first
			render json: @deals.to_json(:include =>{:region => {:only => [:aliasname, :name]}}, :only => [:id, :title,:costs, :imgurl, :smallimgurl])
			if !@deals.nil? 
				@deals.vkpost= true
				@deals.save
			end
		rescue
			redirect_to root_url
		end
	end

	def getrandomfortwitter
		begin
			@deals = Deal.all_active_not_twitter_post(params[:id]).sample(1).first
			render json: @deals.to_json(:include =>{:region => {:only => [:aliasname]}}, :only => [:id, :title,:costs])
			if !@deals.nil? 
				@deals.twitterpost= true
				@deals.save
			end
		rescue
			redirect_to root_url
		end
	end

	def getrandomforfkuban
		begin
			@deals = Deal.all_active_not_fkuban_post(params[:type_id], params[:region_id]).sample(1).first
			render json: @deals.to_json(:include =>{:region => {:only => [:aliasname]}}, :only => [:id, :title,:costs])
			if !@deals.nil? 
				@deals.fkubankpost= true
				@deals.save
			end
		rescue
			redirect_to root_url
		end
	end

	def dealclick
		Stat.click(params[:id])
		head :no_content
	end
end
