class DataPoliciesController < ApplicationController
  # GET /data_policies
  # GET /data_policies.json
  def index
    @data_policies = DataPolicy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_policies }
    end
  end

  # GET /data_policies/1
  # GET /data_policies/1.json
  def show
    @data_policy = DataPolicy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_policy }
    end
  end

  # GET /data_policies/new
  # GET /data_policies/new.json
  def new
    @data_policy = DataPolicy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_policy }
    end
  end

  # GET /data_policies/1/edit
  def edit
    @data_policy = DataPolicy.find(params[:id])
  end

  # POST /data_policies
  # POST /data_policies.json
  def create
    @data_policy = DataPolicy.new(params[:data_policy])

    respond_to do |format|
      if @data_policy.save
        format.html { redirect_to @data_policy, notice: 'Data policy was successfully created.' }
        format.json { render json: @data_policy, status: :created, location: @data_policy }
      else
        format.html { render action: "new" }
        format.json { render json: @data_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /data_policies/1
  # PUT /data_policies/1.json
  def update
    @data_policy = DataPolicy.find(params[:id])

    respond_to do |format|
      if @data_policy.update_attributes(params[:data_policy])
        format.html { redirect_to @data_policy, notice: 'Data policy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_policies/1
  # DELETE /data_policies/1.json
  def destroy
    @data_policy = DataPolicy.find(params[:id])
    @data_policy.destroy

    respond_to do |format|
      format.html { redirect_to data_policies_url }
      format.json { head :no_content }
    end
  end
end
