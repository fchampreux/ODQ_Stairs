class BusinessHierarchiesController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  
  # GET /business_hierarchies
  # GET /business_hierarchies.json
  def index
    @business_hierarchies = BusinessHierarchy.order("hierarchy").limit(20)
    @lignes = BusinessHierarchy.count
  end

  def load
    # Setup counters
    @lignes = BusinessHierarchy.count
    @counter = [] #object, tries, inserts
    
    # Load Business Areas
    monitor = {:object => 'Business Areas', :tries => 0, :inserts => 0}
    business_areas_list = BusinessHierarchy.where("hierarchical_level = 1").order("hierarchy")
    business_areas_list.each do |ba|
      @business_area = BusinessArea.new
      @business_area.playground_id = ba.playground_id
      @business_area.code = ba.pcf_reference
      @business_area.name = ba.name
      @business_area.description = ba.description
      @business_area.hierarchy = ba.hierarchy # This value is overwritten by before filter un the BA model validations
      @business_area.pcf_index = ba.pcf_index
      @business_area.pcf_reference = ba.pcf_reference
      @business_area.status_id = 1
      @business_area.owner_id = current_user.id      
      @business_area.created_by = current_user.user_name
      @business_area.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @business_area.save then monitor[:inserts] += 1 end
      
    end
    @counter.push(monitor)
    
    # Load Business Flows
    monitor = {:object => 'Business Flows', :tries => 0, :inserts => 0}
    business_flows_list = BusinessHierarchy.where("hierarchical_level = 2").order("hierarchy")
    business_flows_list.each do |bf|
      ba=BusinessArea.where("hierarchy = ?", bf.hierarchy.first(-4)).take #removes the last 4 characters of bf to look for ba.
      @business_flow = BusinessFlow.new
      @business_flow.playground_id = bf.playground_id
      @business_flow.business_area_id = ba.id
      @business_flow.code = bf.pcf_reference
      @business_flow.name = bf.name
      @business_flow.description = bf.description
      @business_flow.hierarchy = bf.hierarchy # This value is overwritten by before filter un the BF model validations
      @business_flow.pcf_index = bf.pcf_index
      @business_flow.pcf_reference = bf.pcf_reference
      @business_flow.status_id = 1
      @business_flow.owner_id = current_user.id      
      @business_flow.created_by = current_user.user_name
      @business_flow.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @business_flow.save then monitor[:inserts] += 1 end
      
    end
    @counter.push(monitor)
      
      
    # Load Business Processes 
    monitor = {:object => 'Business Processes', :tries => 0, :inserts => 0}
    business_processes_list = BusinessHierarchy.where("hierarchical_level = 3").order("hierarchy")  
    business_processes_list.each do |bp|
      bf=BusinessFlow.where("hierarchy = ?", bp.hierarchy.first(-4)).take #removes the last 4 characters of bf to look for ba.
      @business_process = BusinessProcess.new
      @business_process.playground_id = bp.playground_id
      @business_process.business_flow_id = bf.id
      @business_process.code = bp.pcf_reference
      @business_process.name = bp.name
      @business_process.description = bp.description
      @business_process.hierarchy = bp.hierarchy # This value is overwritten by before filter un the BP model validations
      @business_process.pcf_index = bp.pcf_index
      @business_process.pcf_reference = bp.pcf_reference
      @business_process.status_id = 1
      @business_process.owner_id = current_user.id      
      @business_process.created_by = current_user.user_name
      @business_process.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @business_process.save then monitor[:inserts] += 1 end
      
    end
    @counter.push(monitor)
    
    # Load Business Activities
      monitor = {:object => 'Activities', :tries => 0, :inserts => 0} 
      activities_list = BusinessHierarchy.where("hierarchical_level = 4").order("hierarchy")
      activities_list.each do |activity|
      bp=BusinessProcess.where("hierarchy = ?", activity.hierarchy.first(-4)).take #removes the last 4 characters of bf to look for ba.
      @activity = Activity.new
      @activity.playground_id = activity.playground_id
      @activity.business_process_id = bp.id
      @activity.code = activity.pcf_reference
      @activity.name = activity.name
      @activity.description = activity.description
      @activity.hierarchy = activity.hierarchy # This value is overwritten by before filter un the Activity model validations
      @activity.pcf_index = activity.pcf_index
      @activity.pcf_reference = activity.pcf_reference
      @activity.status_id = 1
      @activity.owner_id = current_user.id      
      @activity.created_by = current_user.user_name
      @activity.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @activity.save then monitor[:inserts] += 1 end
      
    end
    @counter.push(monitor)
    
    # Load Tasks
      monitor = {:object => 'Tasks', :tries => 0, :inserts => 0} 
      tasks_list = BusinessHierarchy.where("hierarchical_level = 5").order("hierarchy")
      tasks_list.each do |task|
      activity=Activity.where("hierarchy = ?", task.hierarchy.first(-4)).take #removes the last 4 characters of bf to look for ba.
      @task = Task.new
      @task.playground_id = task.playground_id
      @task.activity_id = activity.id
      @task.code = task.pcf_reference
      @task.name = task.name
      @task.description = task.description
      @task.hierarchy = task.hierarchy # This value is overwritten by before filter un the Activity model validations
      @task.pcf_index = task.pcf_index
      @task.pcf_reference = task.pcf_reference
      @task.status_id = 1
      @task.owner_id = current_user.id      
      @task.created_by = current_user.user_name
      @task.updated_by = current_user.user_name
      
      monitor[:tries] += 1
      if @task.save then monitor[:inserts] += 1 end
      
    end
    @counter.push(monitor)
    
    
  end

end