class Project < ActiveRecord::Base
  has_many :tasks, dependent: :nullify
  has_many :discussions, dependent: :nullify
  validates :title, presence: true, uniqueness: {scope: :title}

  before_validation {|x| x.title.strip}
end
