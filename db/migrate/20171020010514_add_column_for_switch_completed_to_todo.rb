class AddColumnForSwitchCompletedToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :is_completed, :boolean
  end
end
