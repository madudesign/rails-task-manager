class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(user_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task), notice: "Your task has been created!"
  end

  def update
    @task = Task.find(params[:id])
    @task.update(user_params)

    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to task_path
  end


  private

  def user_params
     params.require(:task).permit(:title, :details)
  end
end
