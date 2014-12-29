class TasksController < ApplicationController
  def create
	render json: Task.create(task_params)
  end

  def assign
  end

  def update
	task = Task.find(params[:id])
	task.update task_params
	redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:title, :organization_id, :done)
  end
end
