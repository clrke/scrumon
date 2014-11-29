class TasksController < ApplicationController
  def create
  	Task.create params.permit(:title, :organization_id)
  	redirect_to :back
  end

  def assign
  end
end
