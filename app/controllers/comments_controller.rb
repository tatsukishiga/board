class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(
      content: params[:content],
      user_id: @current_user.id,
      topic_id: params[:topic_id]
    )
    @comment.save
    redirect_to("/topics")
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(content: params[:comment][:content])
    if @comment.update(content: params[:comment][:content])
      flash[:notice] = "コメントを編集しました"
      redirect_to("/topics")
    else
      render("comments/edit")
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to("/topics")
  end
end
