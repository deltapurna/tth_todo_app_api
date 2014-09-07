class TasksController < ApplicationController
  def index
    if params[:completed]
      tasks = Task.completed
    else
      tasks = Task.incomplete
    end
    render json: tasks
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: task, status: 201
    else
      render json: task.errors, status: 422
    end
  end

  private
    def task_params
      params.require(:task).permit(:name)
    end
end
