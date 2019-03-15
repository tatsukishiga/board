module UsersHelper
  def u_ensure_correct_user
    @user.id == @current_user.id
  end
end
