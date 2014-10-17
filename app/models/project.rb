class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :title}
end
