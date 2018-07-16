class UsersController < ApplicationController
# Check for active session as administrator
  before_action :authenticate_user!
  before_action :signed_as_admin
  before_action :set_languages_list, only: [:new, :edit, :update, :create]
  before_action :set_groups_list, only: [:new, :edit, :update, :create]
  
# Retrieve current user
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    ### Retrieved by Callback function

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    ### Retrieved by Callback function

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    ### Retrieved by Callback function
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def set_playground
    @user = current_user
    @user.updated_by = current_user.user_name
    @user.current_playground_id = (params[:id])
    log_activity(@user.current_playground_id, 0, @user.id, @user.user_name,
                     request.env['REMOTE_ADDR'], 'User switched playground', 0)
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User switched playground.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current user
    def set_user
      @user = User.find(params[:id]) 
    end
    
  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

    # Check for admin access
    def signed_as_admin
      redirect_to root_url, notice: "You must be administrator to access this page." unless user_is_admin?
    end

  ### strong parameters
  def user_params
    params.require(:user).permit(:login, :first_name, :last_name, :directory_id, :active_from, :active_to, :is_admin, :email,
                                 :language, :description, :password, :password_confirmation, :current_playground_id, :remember_created_at)
  end

end
