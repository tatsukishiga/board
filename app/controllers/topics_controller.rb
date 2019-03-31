class TopicsController < ApplicationController

  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    flash[:notice] = "トピックを削除しました"
    if @current_user.admin?
      redirect_to(admin_path)
    else
      redirect_to("/")
    end
  end
end
