class DiscussionsController < ApplicationController
  before_action :get_project, only: [:index, :new, :create]
  before_action :get_discussions, except: [:create, :update]
  before_action :get_discussion, except: [:new, :create]

  def index
  end

  def new
    @discussion = Discussion.new 
  end

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

  def edit; end

  def update
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

  def get_discussion
    @discussion = Discussion.find params[:id]
  end

  def get_project
    @project = Project.find params[:project_id]
  end
end
