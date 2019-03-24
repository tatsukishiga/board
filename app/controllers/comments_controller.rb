class CommentsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit]}

  def index
    @comments = Comment.all
  end

  def create
    @comment = @current_user.comments.new(
      content: params[:content],
      topic_id: params[:topic_id]
    )
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to(topics_path)
    else
      render ("topics/show")
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(content: params[:comment][:content])
      flash[:notice] = "コメントを編集しました"
      redirect_to(topics_path)
    else
      render("comments/edit")
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to(topics_path)
  end

  def ensure_correct_user
    if @current_user.comments.ids != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to(topics_path)
    end
  end
end
