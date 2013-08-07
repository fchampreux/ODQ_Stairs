class BusinessObjectsController < ApplicationController
  # GET /business_objects
  # GET /business_objects.json
  def index
    @business_objects = BusinessObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_objects }
    end
  end

  # GET /business_objects/1
  # GET /business_objects/1.json
  def show
    @business_object = BusinessObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_object }
    end
  end

  # GET /business_objects/new
  # GET /business_objects/new.json
  def new
    @business_object = BusinessObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_object }
    end
  end

  # GET /business_objects/1/edit
  def edit
    @business_object = BusinessObject.find(params[:id])
  end

  # POST /business_objects
  # POST /business_objects.json
  def create
    @business_object = BusinessObject.new(params[:business_object])

    respond_to do |format|
      if @business_object.save
        format.html { redirect_to @business_object, notice: 'Business object was successfully created.' }
        format.json { render json: @business_object, status: :created, location: @business_object }
      else
        format.html { render action: "new" }
        format.json { render json: @business_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_objects/1
  # PUT /business_objects/1.json
  def update
    @business_object = BusinessObject.find(params[:id])

    respond_to do |format|
      if @business_object.update_attributes(params[:business_object])
        format.html { redirect_to @business_object, notice: 'Business object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_objects/1
  # DELETE /business_objects/1.json
  def destroy
    @business_object = BusinessObject.find(params[:id])
    @business_object.destroy

    respond_to do |format|
      format.html { redirect_to business_objects_url }
      format.json { head :no_content }
    end
  end
end
