class UserAccessesController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  # GET /user_accesses
  # GET /user_accesses.json
  def index
    @user_accesses = UserAccess.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_accesses }
    end
  end

  # GET /user_accesses/1
  # GET /user_accesses/1.json
  def show
    @user_access = UserAccess.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_access }
    end
  end

  # GET /user_accesses/new
  # GET /user_accesses/new.json
  def new
    @user_access = UserAccess.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_access }
    end
  end

  # GET /user_accesses/1/edit
  def edit
    @user_access = UserAccess.find(params[:id])
  end

  # POST /user_accesses
  # POST /user_accesses.json
  def create
    @user_access = UserAccess.new(params[:user_access])

    respond_to do |format|
      if @user_access.save
        format.html { redirect_to @user_access, notice: 'User access was successfully created.' }
        format.json { render json: @user_access, status: :created, location: @user_access }
      else
        format.html { render action: "new" }
        format.json { render json: @user_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_accesses/1
  # PUT /user_accesses/1.json
  def update
    @user_access = UserAccess.find(params[:id])

    respond_to do |format|
      if @user_access.update_attributes(params[:user_access])
        format.html { redirect_to @user_access, notice: 'User access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_accesses/1
  # DELETE /user_accesses/1.json
  def destroy
    @user_access = UserAccess.find(params[:id])
    @user_access.destroy

    respond_to do |format|
      format.html { redirect_to user_accesses_url }
      format.json { head :no_content }
    end
  end
end
