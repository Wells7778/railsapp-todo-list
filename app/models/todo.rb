class Todo < ApplicationRecord
  validates_presence_of :name, :due_date, :note
  def completed?
    !completed_at.blank?
  end
end