class DiscussionsController < ApplicationController
  before_action :get_project, only: [:create, :update]

  def create
    @discussion = @project.discussions.new discussion_params
    authorized(@project)
    # @discussion.project = @project   #redundant
    if @discussion.save
      recent
      redirect_to @project, notice: "Discussion added"
    else
      flash[:alert] = "Problem saving question"
      redirect_to @project
    end
  end

  def update
    @discussion = @project.discussions.find_by_id params[:id]
    if @discussion.update discussion_params
      recent
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
    @project = current_user.member_projects.find_by_id params[:project_id]
  end
end
