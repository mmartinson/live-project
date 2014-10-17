require 'rails_helper'

RSpec.describe Project, :type => :model do

  let(:project_with_title) {Project.new(title: "gg")}
  let(:second_project_with_title) {Project.new(title: "gg")}
  let(:project_without_title) {Project.new}

  describe 'validations' do
    it 'require title to be present' do
      expect(:project_with_title).to be_instance_of(Project)
    end
    it 'require title to be unique within a project' do
      expect(:second_project_with_title).to be_falsey
    end
  end
end