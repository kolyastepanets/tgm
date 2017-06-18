module TasksHelper
  def show_address(task)
    task.address.present? ? task.address : 'Drag marker to choose address'
  end
end
