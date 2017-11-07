class Todo < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :due_date, presence: true
  validates :note, presence: true

  def can_destroy?
    !over_due_date
  end

private
  def over_due_date
    due_date < Date.today
  end
end