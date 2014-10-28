module ApplicationHelper
  def recent_discussion_comments
    #will be:
      #User.recent_discussion.comments
    ['Some insight', 'I disagree', 'YOU ARE A FOOL', 'you are all fools', 'something homophobic'] #to test
  end

  def empty_new_discussion
    Discussion.new
  end

end
