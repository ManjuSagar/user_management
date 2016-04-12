class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
   Task.create(task_params.merge!(:assigned_by=> current_user.id))
   redirect_to :managers
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :assigned_to)
  end

end