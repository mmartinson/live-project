require 'rails_helper'

RSpec.describe Task, :type => :model do

  let(:task_with_title) {Task.new(title: "gg")}
  let(:second_task_with_title) {Task.new(title: "gg")}
  let(:task_without_title) {Task.new}

  describe 'validations' do
    it 'require title to be present' do
      expect(:task_with_title).to be_instance_of(Task)
    end
    it 'require title to be unique with a project' do
      expect(:second_task_with_title).to be_falsey
    end
  end
end
