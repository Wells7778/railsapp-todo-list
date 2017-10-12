class AddCompletedAtToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :completed_at, :datetime
  end
end
