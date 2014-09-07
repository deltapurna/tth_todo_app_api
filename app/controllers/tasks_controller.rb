class TasksController < ApplicationController
  def index
    if params[:completed]
      @tasks = Task.completed
    else
      @tasks = Task.incomplete
    end
    render json: @tasks
  end
end
