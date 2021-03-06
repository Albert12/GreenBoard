class AdvertsController < ApplicationController
  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = Advert.includes(:category).order('created_at desc').all
    @vcounter = ViewsCounter.counter('Page', 'index')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adverts }
    end
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
    @advert = Advert.find(params[:id])
    @vcounter = ViewsCounter.counter('Advert', params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advert }
    end
  end

  # GET /adverts/new
  # GET /adverts/new.json
  def new
    @advert = Advert.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advert }
    end
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(params[:advert])

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Advert was successfully created.' }
        format.json { render json: @advert, status: :created, location: @advert }
      else
        format.html { render action: "new" }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy

    respond_to do |format|
      format.html { redirect_to adverts_url }
      format.json { head :no_content }
    end
  end
end
