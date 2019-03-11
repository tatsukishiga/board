class TopicsController < ApplicationController
  def index
    @topics = Topic.page(params[:page])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = @current_user.topic.new(
      title: params[:title],
      content: params[:content],
    )
    if @topic.save
      flash[:notice] = "トピックを作成しました"
      redirect_to("/topics")
    else
      render("topics/new")
    end
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @user = @topic.user
    @comments = Comment.all
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def search_result
    @topics = Topic.where(title: params[:title])
  end
end
