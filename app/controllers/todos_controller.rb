class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy, :complete]
  def index
    @todos = Todo.all.order("is_completed, due_date DESC")
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.is_completed = false
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
  def show

  end
  def destroy
    if @todo.can_destroy?
      @todo.destroy
      redirect_to root_path, notice: "待辦事項已刪除！"
    else
      redirect_to root_path, notice: "超過日期無法刪除！"
    end
  end

  def complete
    if !@todo.is_completed
      @todo.update(completed_at: Time.now, is_completed: true)
      redirect_to root_path, notice: "待辦事項完成！"
    else
      @todo.update_attribute(:is_completed, false)
      redirect_to root_path, notice: "恢復待辦事項！"
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