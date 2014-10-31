class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_project
  before_action :get_task, only: [:show, :edit, :update, :destroy]
  before_action :get_discussions, only: [:show, :new, :edit]
  before_action :generate_empty_discussion, only: [:show, :new, :edit] #defined in app controller


  def new
    @task = Task.new
    @tasks = @project.tasks
  end

  def create
    authorize(@project)
    @task = @project.tasks.new(task_params)
    if @task.save
      recent
      redirect_to @project, notice: "Task added"
    else
      flash[:alert] = "Problem adding task, check that it has a unique name"
      redirect_to new_project_task_path(@project, @task)
      # render :new               Tam, why does this not work?
    end
  end

  def show
    @tasks = @project.tasks
    recent
  end

  def edit
    @tasks = @project.tasks
  end

  def update
    authorize(@project)
    if @task.update(task_params)
      recent
      redirect_to @project, notice: "Task Updated"
    else
      flash[:alert] = "Problem editing task, chek that it has a unique name"
      redirect_to edit_project_task_path(@project, @task)
    end
  end

  def destroy
    authorize(@project)
    @project = @task.project
    @task.destroy
    recent
    flash[:notice] = "Task deleted"
    redirect_to project_path(@project)
  end


  private

  def get_project
    @project = current_user.member_projects.find(params[:project_id])
  end

  def get_task
    @task = @project.tasks.find(params[:id]) 
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end

  def get_discussions
    @discussions = @project.discussions
  end
end
