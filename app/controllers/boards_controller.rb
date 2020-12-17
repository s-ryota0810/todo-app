class BoardsController < ApplicationController
  
  
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
  
  
  private
  
  def board_params
    params.require(:board).permit(:user_id, :name, :description)
  end
end