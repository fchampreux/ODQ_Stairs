class CheckTypesController < ApplicationController
  # GET /check_types
  # GET /check_types.json
  def index
    @check_types = CheckType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @check_types }
    end
  end

  # GET /check_types/1
  # GET /check_types/1.json
  def show
    @check_type = CheckType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @check_type }
    end
  end

  # GET /check_types/new
  # GET /check_types/new.json
  def new
    @check_type = CheckType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @check_type }
    end
  end

  # GET /check_types/1/edit
  def edit
    @check_type = CheckType.find(params[:id])
  end

  # POST /check_types
  # POST /check_types.json
  def create
    @check_type = CheckType.new(params[:check_type])

    respond_to do |format|
      if @check_type.save
        format.html { redirect_to @check_type, notice: 'Check type was successfully created.' }
        format.json { render json: @check_type, status: :created, location: @check_type }
      else
        format.html { render action: "new" }
        format.json { render json: @check_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /check_types/1
  # PUT /check_types/1.json
  def update
    @check_type = CheckType.find(params[:id])

    respond_to do |format|
      if @check_type.update_attributes(params[:check_type])
        format.html { redirect_to @check_type, notice: 'Check type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @check_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_types/1
  # DELETE /check_types/1.json
  def destroy
    @check_type = CheckType.find(params[:id])
    @check_type.destroy

    respond_to do |format|
      format.html { redirect_to check_types_url }
      format.json { head :no_content }
    end
  end
end
