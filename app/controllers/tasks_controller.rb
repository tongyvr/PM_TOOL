class TasksController < ApplicationController

  before_action :authenticate_user!
  before_filter :authenticate_user!
  
  def new
    @task = Task.new
  end

  def create
    @task       = Task.new task_params
    if @task.save
      redirect_to tasks_path(@task), notice: "Task created!"
    else
      flash[:alert] = "Task not created!"
      render :new
    end
  end

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    task_params
    if @task.update task_params
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path, notice: "Task deleted"
  end

  def show
    find_task
    # @task = Task.new
  end

  private
  def find_task
    @task = Task.find params[:id]
  end
  def task_params
    params.require(:task).permit(:title, :due_date)
  end
end
