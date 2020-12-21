class Task < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :board
  
  has_one_attached :eyecatch
  
  def eyecatch_image
    if self.eyecatch.present?
      self.eyecatch
    else
      'saikoro.png'
    end
  end
end
