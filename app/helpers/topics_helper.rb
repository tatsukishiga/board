module TopicsHelper
  def t_ensure_correct_user
    @topic_user.user_id == @current_user.id
  end

  def comment_user(user_id: comment.user_id)
    user_id == @current_user.id
  end
end
