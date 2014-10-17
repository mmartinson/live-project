require 'rails_helper'

RSpec.describe Comment, :type => :model do

  let(:comment_with_body) {Comment.new(body: "gg")}
  let(:comment_without_body) {Comment.new}
  
  describe 'validations' do 
    it 'requires body to be present' do
      expect(:comment_with_body).to be_instance_of(Comment)
      expect(:comment_without_body).to_not be_instance_of(Comment) 
    end
  end
end
