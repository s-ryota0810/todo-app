class TasksController < ApplicationController
  
  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end
  
  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(@task.board_id), notice: 'タスクを追加しました'
    else
      flash.now[:error] = 'タスクの追加に失敗しました'
      render :new
    end
  end
  
  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end
  
  
  private
  
    def task_params
      params.require(:task).permit(:title, :content, :limit, :eyecatch)
    end
  
end