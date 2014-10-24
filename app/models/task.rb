class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: :true, uniqueness: :true #change scope to project once associations are added
end
