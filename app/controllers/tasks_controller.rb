class TasksController < ApplicationController
  before_action :get_task, only: [:show, :edit, :update, :delete]
  ASSOCIATED_PROJECT_ID = Project.limit(10).sample.id

  def new
    @task=Task.new
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

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @tast, notice: "Task Updated"
    else
      flash[:alert] = "Problem editing task, chek that it has a unique name"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task deleted"
    redirect_to project(Project.find(ASSOCIATED_PROJECT_ID))
  end


  private

  def get_task
    @tast = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :due_date)
  end
end

