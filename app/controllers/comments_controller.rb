class CommentsController < ApplicationController
  
  def new
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end
  
  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_task_path(task.board_id, task.id), notice: 'コメントを作成しました'
    else
      flash.now[:error] = 'コメントを追加できませんでした'
      render :new
    end
  end
  
  
  
  
  private
  
    def comment_params
      params.require(:comment).permit(:user_id, :content, :task_id)
    end
end