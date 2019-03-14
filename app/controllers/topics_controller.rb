class TopicsController < ApplicationController
  before_action :authenticate_user

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
    @topic_user = Topic.find_by(id: params[:id])
    @comments = Comment.all
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    @topic = Topic.find_by(id: params[:id])
    @topic.update(title: params[:title], content: params[:content])
    if @topic.update(title: params[:title], content: params[:content])
      flash[:notice] = "トピックの情報を編集しました"
      redirect_to("/topics/#{@topic.id}")
    else
      render("topics/edit")
    end
end

  def search_result
    @topics = Topic.where(title: params[:title])
  end
end
