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
  
  def edit
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end
  
  def update
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path, notice: 'タスクを更新しました'
    else
      flash.now[:error] = 'タスクを更新できませんでした'
      render :edit
    end
  end
  
  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(board), notice: 'タスクを削除しました'
  end
  
  
  private
  
    def task_params
      params.require(:task).permit(:title, :content, :limit, :eyecatch)
    end
  
end