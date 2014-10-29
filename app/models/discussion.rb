class Discussion < ActiveRecord::Base
  belongs_to :project
  # has_many :comments
  validates :title, presence: :true

  before_save :add_new_status


  private

  def add_new_status
    self.status = 'new' unless self.status == 'urgent'
  end
end
