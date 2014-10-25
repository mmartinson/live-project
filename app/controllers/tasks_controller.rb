class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
    @tasks = @project.tasks
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    # @tasks = @project.tasks                     #this is for the render
    if @task.save
      redirect_to @project, notice: "Task added"
    else
      flash[:alert] = "Problem adding task, check that it has a unique name"
      redirect_to new_project_task_path(@project, @task)
      # render :new               Tam, why does this not work?

    end
  end

  def show
    # @project = @task.project
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  def edit
    @project = Project.find(params[:project_id]) 
    @tasks = @project.tasks
  end

  def update
    @project = Project.find(params[:project_id])
    if @task.update(task_params)
      redirect_to @project, notice: "Task Updated"
    else
      flash[:alert] = "Problem editing task, chek that it has a unique name"
      redirect_to edit_project_task_path(@project, @task)
    end
  end

  def destroy
    @project = @task.project
    @task.destroy
    flash[:notice] = "Task deleted"
    redirect_to project_path(@project)
  end


  private

  def get_task
    @task = Task.find(params[:id]) 
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end
end

