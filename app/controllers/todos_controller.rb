class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy, :complete]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    compare_date = @todo.due_date <=> Time.now.to_date
    if compare_date <= 0
      redirect_to root_path, notice: "超過完成日期無法刪除！"
    else
       @todo.destroy
       redirect_to root_path, notice: "待辦事項已刪除！"
    end
   end

  def complete
    if !@todo.completed?
      @todo.update_attribute(:completed_at, Time.now)
      redirect_to root_path, notice: "待辦事項完成！"
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)
  end
end
