class TimeScalesController < ApplicationController
  # GET /time_scales
  # GET /time_scales.json
  def index
    @time_scales = TimeScale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_scales }
    end
  end

  # GET /time_scales/1
  # GET /time_scales/1.json
  def show
    @time_scale = TimeScale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_scale }
    end
  end

  # GET /time_scales/new
  # GET /time_scales/new.json
  def new
    @time_scale = TimeScale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_scale }
    end
  end

  # GET /time_scales/1/edit
  def edit
    @time_scale = TimeScale.find(params[:id])
  end

  # POST /time_scales
  # POST /time_scales.json
  def create
    @time_scale = TimeScale.new(params[:time_scale])

    respond_to do |format|
      if @time_scale.save
        format.html { redirect_to @time_scale, notice: 'Time scale was successfully created.' }
        format.json { render json: @time_scale, status: :created, location: @time_scale }
      else
        format.html { render action: "new" }
        format.json { render json: @time_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_scales/1
  # PUT /time_scales/1.json
  def update
    @time_scale = TimeScale.find(params[:id])

    respond_to do |format|
      if @time_scale.update_attributes(params[:time_scale])
        format.html { redirect_to @time_scale, notice: 'Time scale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_scales/1
  # DELETE /time_scales/1.json
  def destroy
    @time_scale = TimeScale.find(params[:id])
    @time_scale.destroy

    respond_to do |format|
      format.html { redirect_to time_scales_url }
      format.json { head :no_content }
    end
  end
end
