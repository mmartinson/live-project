class User < ActiveRecord::Base
  has_many :memberships, dependent: :nullify
  has_many :member_projects, through: :memberships, source: :project


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first

      unless user
          user = User.create(name: data["name"],
             email: data["email"],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end

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
