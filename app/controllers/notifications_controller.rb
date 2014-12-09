class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  
  # Check for active session 
  before_action :signed_in_user

# Retrieve current breach
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

# Create the selection lists be used in the form
  before_action :set_users_list, only: [:new, :edit, :update, :create]
  before_action :set_notification_statuses_list, only: [:new, :edit, :update, :create]
  before_action :set_business_objects_list, only: [:new, :edit, :update, :create]
  before_action :set_scopes_list, only: [:new, :edit, :update, :create]
  before_action :set_severity_list, only: [:new, :edit, :update, :create]
  
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.pgnd(current_playground).order("created_at DESC").paginate(page: params[:page], :per_page => paginate_lines)

  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)
    metadata_setup(@notification)    

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notification }
      else
        format.html { render action: 'new' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end
    
    # Retrieve business objects list
    def set_business_objects_list
      @business_objects_list = BusinessObject.all
    end

    # Retrieve scopeslist
    def set_scopes_list
      @scopes_list = Scope.all
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:playground_id, :name, :description, :created_by, :updated_by,
                                           :owner_id, :severity_id, :scope_id, :business_object_id, :odq_unique_id,
                                           :odq_object_id, :expected_at, :closed_at, :responsible_id, :status_id)
    end
end
