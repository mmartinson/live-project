class StaticController < ApplicationController

  def home
    render layout: 'welcome'    
  end

  def about
    render layout: 'welcome'
  end
  
end
