module TopicsHelper
  def t_ensure_correct_user
    @topic_user.user_id == @current_user.id
  end

  def comment_user?(comment: comment)
    comment.user_id == @current_user.id
  end
end
