class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
  
  
  def index
    @boards = Board.all
  end
  
  def new
    @board = current_user.boards.build
  end
  
  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: '保存しました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end
  
  def show
    @board = Board.find(params[:id])
    @tasks = @board.tasks
  end
  
  def edit
    @board = current_user.boards.find(params[:id])
  end
  
  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除しました'
  end
  
  
  private
  
  def board_params
    params.require(:board).permit(:user_id, :name, :description)
  end
end