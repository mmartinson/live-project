class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:index, :show, :edit, :update, :destroy]
  before_action :find_associated_tasks, only: [:show, :edit]
  before_action :generate_empty_discussion, only: [:show, :new, :edit] #defined in app controller

  def index
    @projects = Project.all
    @project = current_user.recent_project
    @project ||= Project.first
  end


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "New Live Project '#{@project.title}'' created in the database"
      redirect_to project_path(@project)
    else
      flash.now[:alert] = "There was some kind of problem saving your new Live Project. Check input fields and try again."
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params) 
      redirect_to @project, notice: "Live Project updated"
    else
      flash.now[:alert] = "There was some kind of problem with your update. Check input fields and try again"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "#{@project.title} was deleted from the database"
    redirect_to projects_path
  end

  private

  def find_project
    if params[:id]
      @project = Project.find params[:id]
      return
    else
      @project = Project.first #to handle errors, refactor?
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end

  def find_associated_tasks
    @tasks = @project.tasks
  end
end
