class Project < ActiveRecord::Base
  has_many :tasks, dependents: :nullify
  has_many :discussions, dependents: :nullify
  validates :title, presence: true, uniqueness: {scope: :title}
end
