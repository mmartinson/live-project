class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource


  private

  NO_ACCESS = "You need to be included as a member of this project to view or make changes. Any current member can add you to the project"
  def authorized(project)
    unless project.respond_to?(:members) && project.members.include?(current_user)
      return redirect_to projects_path, alert: NO_ACCESS 
    end
    true
  end

  def recent
    current_user.recent_project_id = @project.id
  end


  def layout_by_resource
    if devise_controller?
      "registration"
    else
      "application"
    end
  end

  def generate_empty_discussion
    @discussion = Discussion.new
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :username, :second_email, :phone_number) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :password, :current_password, :username, :secondary_email, :phone_number) }
  end

end
