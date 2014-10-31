class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :find_associated_tasks, only: [:show, :edit]
  before_action :generate_empty_discussion, only: [:show, :new, :edit] #defined in app controller

  def index
    @projects = current_user.member_projects
    @project = current_user.member_projects.find_by_id current_user.recent_project_id
    @project ||= @projects.first
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.members = [current_user]
    if @project.save
      current_user.recent_project_id = @project.id
      flash[:notice] = "New Live Project '#{@project.title}'' created in the database"
      redirect_to project_path(@project)
    else
      flash.now[:alert] = "There was some kind of problem saving your new Live Project. Check input fields and try again."
      render :new
    end
  end

  def show
    authorized(@project)
    recent
  end

  def edit
    authorized(@project)
  end

  def update
    authorized(@project)
    if @project.update(project_params) 
      recent
      redirect_to @project, notice: "Live Project updated"
    else
      flash.now[:alert] = "There was some kind of problem with your update. Check input fields and try again"
      render :edit
    end
  end

  def destroy
    authorized(@project)
    @project.destroy
    flash[:notice] = "#{@project.title} was deleted from the database"
    redirect_to projects_path
  end

  private

  def find_project
    if params[:id]
      @project = current_user.member_projects.find_by_id params[:id]
      authorized(@project)
      return
    else
      @project = current_user.member_projects.first #to handle errors, refactor?
      authorized(@project)
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

  def find_associated_tasks
    @tasks = @project.tasks
  end
end
