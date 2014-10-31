class Project < ActiveRecord::Base
  has_many :tasks, dependent: :nullify
  has_many :discussions, dependent: :nullify
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships, source: :user

  validates :title, presence: true, uniqueness: {scope: :title}

  before_validation {|x| x.title.strip}
end
