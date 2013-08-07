class BusinessFlowsController < ApplicationController
  # GET /business_flows
  # GET /business_flows.json
  def index
    @business_flows = BusinessFlow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_flows }
    end
  end

  # GET /business_flows/1
  # GET /business_flows/1.json
  def show
    @business_flow = BusinessFlow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_flow }
    end
  end

  # GET /business_flows/new
  # GET /business_flows/new.json
  def new
    @business_flow = BusinessFlow.new
    @business_flow.business_area_id = params[:business_area_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_flow }
    end
  end

  # GET /business_flows/1/edit
  def edit
    @business_flow = BusinessFlow.find(params[:id])
  end

  # POST /business_flows
  # POST /business_flows.json
  def create
    @business_flow = BusinessFlow.new(params[:business_flow])

    respond_to do |format|
      if @business_flow.save
        format.html { redirect_to @business_flow, notice: 'Business flow was successfully created.' }
        format.json { render json: @business_flow, status: :created, location: @business_flow }
      else
        format.html { render action: "new" }
        format.json { render json: @business_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_flows/1
  # PUT /business_flows/1.json
  def update
    @business_flow = BusinessFlow.find(params[:id])

    respond_to do |format|
      if @business_flow.update_attributes(params[:business_flow])
        format.html { redirect_to @business_flow, notice: 'Business flow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_flows/1
  # DELETE /business_flows/1.json
  def destroy
    @business_flow = BusinessFlow.find(params[:id])
    @business_flow.destroy

    respond_to do |format|
      format.html { redirect_to business_flows_url }
      format.json { head :no_content }
    end
  end
end
