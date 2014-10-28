class StaticController < ApplicationController

  def welcome
    if current_user
      redirect_to projects_path
    else render layout: 'welcome'    
    end
  end

end
