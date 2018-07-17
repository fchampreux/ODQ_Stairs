class BusinessHierarchiesController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  
  # GET /business_hierarchies
  # GET /business_hierarchies.json
  def index
    @business_hierarchies = BusinessHierarchy.order("hierarchy").limit(20)
    @lignes = BusinessHierarchy.count
  end

  # Loads each element of the business hierarchy
  def load
    # Setup counters
    @lignes = BusinessHierarchy.count
    @counter = [] #object, tries, inserts

    # Read statuses Ids
    new_status = Parameter.joins(:parameters_list).where("parameters_lists.code = ? and parameters.code = ?", 'LIST_OF_STATUSES','NEW').take!
    audit_status = Parameter.joins(:parameters_list).where("parameters_lists.code = ? and parameters.code = ?", 'LIST_OF_BREACH_TYPES','INIT').take!
    
    # Load Business Areas
    monitor = {:object => 'Business Areas', :tries => 0, :inserts => 0}
    business_areas_list = BusinessHierarchy.where("hierarchical_level = 1").order("hierarchy")
    business_areas_list.each do |ba|
      @business_area = BusinessArea.new
      @business_area.playground_id = ba.playground_id
      @business_area.code = ba.pcf_reference.remove('.0')
      @business_area.name = ba.name
      @business_area.description = ba.description
      @business_area.hierarchy = ba.hierarchy # This value is overwritten by before filter un the BA model validations
      @business_area.pcf_index = ba.pcf_index
      @business_area.pcf_reference = ba.pcf_reference
      @business_area.status_id = new_status.id
      @business_area.owner_id = current_user.id      
      @business_area.created_by = current_user.user_name
      @business_area.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @business_area.save
        monitor[:inserts] += 1
      else
        log_activity(ba.playground_id, 1, @business_area.id, ba.hierarchy + ' ' + ba.name,
                     request.env['REMOTE_ADDR'], @business_area.errors.full_messages, audit_status.id)
      end
      
    end
    @counter.push(monitor)
    
    # Load Business Flows
    monitor = {:object => 'Business Flows', :tries => 0, :inserts => 0}
    business_flows_list = BusinessHierarchy.where("hierarchical_level = 2").order("hierarchy")
    business_flows_list.each do |bf|
      ba=BusinessArea.where("hierarchy = ?", bf.hierarchy.first(-4)).take! #removes the last 4 characters of bf to look for ba.
      @business_flow = BusinessFlow.new
      @business_flow.playground_id = bf.playground_id
      @business_flow.business_area_id = ba.id
      @business_flow.code = bf.pcf_reference.remove(ba.pcf_reference.chomp('0'))
      @business_flow.name = bf.name
      @business_flow.description = bf.description
      @business_flow.hierarchy = bf.hierarchy # This value is overwritten by before filter un the BF model validations
      @business_flow.pcf_index = bf.pcf_index
      @business_flow.pcf_reference = bf.pcf_reference
      @business_flow.status_id = new_status.id
      @business_flow.owner_id = current_user.id      
      @business_flow.created_by = current_user.user_name
      @business_flow.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @business_flow.save 
        monitor[:inserts] += 1 
      else
        log_activity(bf.playground_id, 2, @business_flow.id, bf.hierarchy + ' ' + bf.name,
                     request.env['REMOTE_ADDR'], @business_flow.errors.full_messages, audit_status.id)
      end
      
    end
    @counter.push(monitor)
      
      
    # Load Business Processes 
    monitor = {:object => 'Business Processes', :tries => 0, :inserts => 0}
    business_processes_list = BusinessHierarchy.where("hierarchical_level = 3").order("hierarchy")  
    business_processes_list.each do |bp|
      bf=BusinessFlow.where("hierarchy = ?", bp.hierarchy.first(-4)).take! #removes the last 4 characters of bf to look for bf.
      @business_process = BusinessProcess.new
      @business_process.playground_id = bp.playground_id
      @business_process.business_flow_id = bf.id
      @business_process.code = bp.pcf_reference.remove(bf.pcf_reference + '.')
      @business_process.name = bp.name
      @business_process.description = bp.description
      @business_process.hierarchy = bp.hierarchy # This value is overwritten by before filter un the BP model validations
      @business_process.pcf_index = bp.pcf_index
      @business_process.pcf_reference = bp.pcf_reference
      @business_process.status_id = new_status.id
      @business_process.owner_id = current_user.id      
      @business_process.created_by = current_user.user_name
      @business_process.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @business_process.save 
        monitor[:inserts] += 1
      else
        log_activity(bp.playground_id, 3, @business_process.id, bp.hierarchy + ' ' + bp.name,
                     request.env['REMOTE_ADDR'], @business_process.errors.full_messages, audit_status.id)
      end
      
      
    end
    @counter.push(monitor)
    
    # Load Business Activities
      monitor = {:object => 'Activities', :tries => 0, :inserts => 0} 
      activities_list = BusinessHierarchy.where("hierarchical_level = 4").order("hierarchy")
      activities_list.each do |activity|
      bp=BusinessProcess.where("hierarchy = ?", activity.hierarchy.first(-4)).take! #removes the last 4 characters of bf to look for bp.
      @activity = Activity.new
      @activity.playground_id = activity.playground_id
      @activity.business_process_id = bp.id
      @activity.code = activity.pcf_reference.remove(bp.pcf_reference + '.')
      @activity.name = activity.name
      @activity.description = activity.description
      @activity.hierarchy = activity.hierarchy # This value is overwritten by before filter un the Activity model validations
      @activity.pcf_index = activity.pcf_index
      @activity.pcf_reference = activity.pcf_reference
      @activity.status_id = new_status.id
      @activity.owner_id = current_user.id      
      @activity.created_by = current_user.user_name
      @activity.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @activity.save 
        monitor[:inserts] += 1
      else
        log_activity(activity.playground_id, 4, @activity.id, activity.hierarchy + ' ' + activity.name,
                     request.env['REMOTE_ADDR'],  @activity.errors.full_messages, audit_status.id)
      end
      
      
    end
    @counter.push(monitor)
    
    # Load Tasks
      monitor = {:object => 'Tasks', :tries => 0, :inserts => 0} 
      tasks_list = BusinessHierarchy.where("hierarchical_level = 5").order("hierarchy")
      tasks_list.each do |task|
      activity=Activity.where("hierarchy = ?", task.hierarchy.first(-4)).take! #removes the last 4 characters of bf to look for activity.
      @task = Task.new
      @task.playground_id = task.playground_id
      @task.activity_id = activity.id
      @task.code = task.pcf_reference.remove(activity.pcf_reference + '.')
      @task.name = task.name
      @task.description = task.description
      @task.hierarchy = task.hierarchy # This value is overwritten by before filter un the Activity model validations
      @task.pcf_index = task.pcf_index
      @task.pcf_reference = task.pcf_reference
      @task.status_id = new_status.id
      @task.owner_id = current_user.id      
      @task.created_by = current_user.user_name
      @task.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @task.save 
        monitor[:inserts] += 1
      else
        log_activity(task.playground_id, 5, @task.id, task.hierarchy + ' ' + task.name,
                     request.env['REMOTE_ADDR'], @task.errors.full_messages, audit_status.id)
      end
      
    end
    @counter.push(monitor)
    log_activity(current_user.playground_id, 0, 0, 'Loading business hierarchy',
                     request.env['REMOTE_ADDR'], 'Load successful', 0)
  end

end
