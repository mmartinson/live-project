class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    return name if self.name
    email
  end

  def recent_project
    if recent_project_id
      Project.find recent_project_id
    elsif 
      Project.where(user_id: id)[0]
    else
      Project.new
    end
  end
end
