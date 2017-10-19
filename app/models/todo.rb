class Todo < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :due_date, presence: true
  validates :note, presence: true
  def completed?
    !completed_at.blank?
  end
end