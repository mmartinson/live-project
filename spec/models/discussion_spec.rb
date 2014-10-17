require 'rails_helper'

RSpec.describe Discussion, :type => :model do

  let(:discussion_with_title) {Discussion.new(title: "gg")}
  let(:discussion_without_title) {Discussion.new}

  describe 'validations' do
    it 'requires title to be present' do
      expect(:discussion_with_title).to be_instance_of(Discussion)
      expect(:discussion_without_title).to_not be_instance_of(Discussion)
    end
  end
end
