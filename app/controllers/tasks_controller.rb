class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :destroy]
  ASSOCIATED_PROJECT_ID = Project.limit(4).sample.id

  def new
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task added"
    else
      flash[:alert] = "Problem adding task, check that it has a unique name"
      render :new
    end
  end

  def show
    @tasks = Task.all
  end

  def edit
    @tasks = Task.all
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "Task Updated"
    else
      flash[:alert] = "Problem editing task, chek that it has a unique name"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task deleted"
    redirect_to project_path(Project.find(ASSOCIATED_PROJECT_ID))
  end


  private

  def get_task
    @task = Task.find(params[:id]) 
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end
end

