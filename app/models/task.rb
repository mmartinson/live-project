class Task < ActiveRecord::Base
  validates :title, presence: :true, uniqueness: :true #change scope to project once associations are added
end
