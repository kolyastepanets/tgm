module ServicesHelper
  def active_service(service_id, current_id)
    'active-service' if service_id == current_id
  end
end
