class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards, dependent: :destroy
  
  
  
  def user_account
    self.email.split('@').first
  end
  
  def has_written?(board)
    self.boards.exists?(id: board.id)
  end
end
