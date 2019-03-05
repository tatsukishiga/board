class TopicsController < ApplicationController
  def index
    @topics = Topic.all.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(
      title: params[:title],
      content: params[:content],
      user_id: @current_user.id
    )
    if @topic.save
      flash[:notice] = "トピックを作成しました"
      redirect_to("/topics/index")
    else
      render("topics/new")
    end
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @user = @topic.user
    @comments = Comment.all
  end
end
