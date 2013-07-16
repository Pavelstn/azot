class MainController < ApplicationController

  def index
    begin
     @deals = Deal.on_top()
     
     @categories_ls=Category.active_only()
  
    rescue
      redirect_to root_url
    end
  end

  def category
    begin
      @category= Category.find_by_aliasname(params[:category])

      @subcategories= @category.children

      @deals = Deal.active_from_category(@category.id)

      @categories_ls=Category.active_only()

    rescue
      redirect_to root_url
      
    end
  end

  def subcategory
   begin
    @category= Category.find_by_aliasname(params[:subcategory])
    if @category
      @subcategories= @category.siblings
      @deals = Deal.active_from_category(@category.id)
      @categories_ls=Category.active_only()

      render "category"
    else 

      redirect_to :action => "detail", :id => params[:subcategory]
    end
  rescue
    redirect_to root_url
  end
end

  def detail
    begin
      @deal = Deal.find(params[:id])
      @category= Category.find(@deal.category_id)
      @subcategories= @category.siblings
      @categories_ls=Category.active_only()
      @deals = Deal.active_from_category(@category.id)

     Stat.loadpage(@deal.id)
    rescue
      redirect_to root_url
    end
  end

end
