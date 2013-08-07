class BusinessAreasController < ApplicationController
  # GET /business_areas
  # GET /business_areas.json
  def index
    @business_areas = BusinessArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_areas }
    end
  end

  # GET /business_areas/1
  # GET /business_areas/1.json
  def show
    @business_area = BusinessArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_area }
    end
  end

  # GET /business_areas/new
  # GET /business_areas/new.json
  def new
    @business_area = BusinessArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_area }
    end
  end

  # GET /business_areas/1/edit
  def edit
    @business_area = BusinessArea.find(params[:id])
  end

  # POST /business_areas
  # POST /business_areas.json
  def create
    @business_area = BusinessArea.new(params[:business_area])

    respond_to do |format|
      if @business_area.save
        format.html { redirect_to @business_area, notice: 'Business area was successfully created.' }
        format.json { render json: @business_area, status: :created, location: @business_area }
      else
        format.html { render action: "new" }
        format.json { render json: @business_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_areas/1
  # PUT /business_areas/1.json
  def update
    @business_area = BusinessArea.find(params[:id])

    respond_to do |format|
      if @business_area.update_attributes(params[:business_area])
        format.html { redirect_to @business_area, notice: 'Business area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_areas/1
  # DELETE /business_areas/1.json
  def destroy
    @business_area = BusinessArea.find(params[:id])
    @business_area.destroy

    respond_to do |format|
      format.html { redirect_to business_areas_url }
      format.json { head :no_content }
    end
  end
end
