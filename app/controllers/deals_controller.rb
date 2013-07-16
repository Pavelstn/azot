class DealsController < ApplicationController
  load_and_authorize_resource 
  # GET /deals
  # GET /deals.json
  layout "admin"
  def index
    @cf= Categoryfilter.new

    if request.post?
      category_id= params[:categoryfilter][:category_id]
      session[:category_id] = category_id
      if category_id==""  #Сбрасываем фильтр категорий
       session[:category_id]= nil
      end
    end
    
    if session[:category_id]
      category_id= session[:category_id]
      @cf.category_id=category_id   #хочу в индию

      @deals = Deal.notdelete_from_category(category_id)
    else
      @deals = Deal.notdelete
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deals }
    end
end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/new
  # GET /deals/new.json
  def new
    @deal = Deal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/1/edit
  def edit
    @deal = Deal.find(params[:id])
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(params[:deal])

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deals/1
  # PUT /deals/1.json
  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end
  def destroy_all
    Deal.destroy_all()
    redirect_to deals_url 
  end
end
