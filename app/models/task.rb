# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  limit      :datetime
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#
class Task < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :board
  has_many :comments, dependent: :destroy
  
  has_one_attached :eyecatch
  
  def eyecatch_image
    if self.eyecatch.present?
      self.eyecatch
    else
      'saikoro.png'
    end
  end
end
