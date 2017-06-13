class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
    # render json: @tasks
    respond_to do |format|
      format.js { render 'lightbox' }
    end
  end
end
