class UsersController < ApplicationController
  before_action :ensure_correct_admin, {only: [:admin]}

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "アカウントを削除しました"
    if @current_user.admin_status == true
      redirect_to(admin_path)
    else
      redirect_to("/")
    end
  end

  def admin
    @users = User.page(params[:page])
    @topics = Topic.page(params[:page])
  end

  def ensure_correct_admin
    if @current_user.admin_status != true
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
