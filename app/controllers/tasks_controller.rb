class TasksController < ApplicationController
  before_action :set_task, only: [:update, :edit, :destroy]
  respond_to :html, :js

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
  end

  def edit
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :service_id, :address, :held_at, :service)
  end
end
