module TopicsHelper

  def ensure_correct_user
    @topic_user.user_id == @current_user.id
  end
  
  def comment_user
    @topic_user.comments.each do |comment|
      comment.user.id == @current_user.id
    end
  end
end
