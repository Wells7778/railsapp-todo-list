class TodosController < ApplicationController
  before_action :set_todo, :only => [:show, :edit, :update, :destroy]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_url
    else
      render :action => :new
    end
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_url
    else
      render :action => :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_url
  end
  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:content)
  end
end
