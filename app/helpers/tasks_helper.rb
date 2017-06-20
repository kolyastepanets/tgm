module TasksHelper
  def active_class(service_type, current_type)
    'active-type-service' if service_type == current_type
  end

  def task_full_title(task)
    "I need a #{task.service.classification} to #{task.service.name}" if task.service
  end
end
