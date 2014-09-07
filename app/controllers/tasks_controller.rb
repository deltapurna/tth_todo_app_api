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
      render json: task, status: 201, location: task
    else
      render json: task.errors, status: 422
    end
  end

  def update
    task = Task.find(params[:id])
    
    if task.update(task_params)
      render json: task, status: 200, location: task
    else
      render json: task.errors, status: 422
    end
  end

  def destroy
    Task.find(params[:id]).destroy

    head 204
  end

  private
    def task_params
      params.require(:task).permit(:name, :completed_at)
    end
end
