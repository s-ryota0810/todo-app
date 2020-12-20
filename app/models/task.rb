class Task < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :board
  
  has_one_attached :eyecatch
end
