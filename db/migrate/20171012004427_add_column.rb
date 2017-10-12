class AddColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :content, :name
    add_column :todos, :due_date, :date
    add_column :todos, :note, :text
  end
end
