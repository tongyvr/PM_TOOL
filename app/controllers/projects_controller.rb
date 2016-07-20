class ProjectsController < ApplicationController
  
  before_filter :user_signed_in?
  before_filter :authenticate_user!


  def new
    @project = Project.new
  end

  def create
    @project       = Project.new project_params
    if @project.save
      redirect_to projects_path(@project), notice: "Project created!"
    else
      flash[:alert] = "Project not created!"
      render :new
    end
  end

  def index
    @projects = Project.order(created_at: :desc)
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    project_params
    if @project.update project_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path, notice: "Project deleted"
  end

  def show
    @project = Project.find params[:id]
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end



end
