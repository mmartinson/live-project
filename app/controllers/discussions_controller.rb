class DiscussionsController < ApplicationController
  before_action :get_project, only: [:create, :update]

  def create
    @discussion = Discussion.new discussion_params
    @discussion.project = @project
    if @discussion.save
      redirect_to @project, notice: "Discussion added"
    else
      flash[:alert] = "Problem saving question"
      redirect_to @project
    end
  end

  def update
    @discussion = Discussion.find params[:id]
    if @discussion.update discussion_params
      redirect_to @project, notice: "Discussion updated"
    else
      redirect_to @project, alert: "Problem updating discussion"
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title, :status, :sticky)
  end

  def get_project
    @project = Project.find params[:project_id]
  end
end
