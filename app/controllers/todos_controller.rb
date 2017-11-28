class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
      # success
    else
      # fail
      render :edit
    end    
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      # success
      redirect_to todos_path
    else
      # fail
      render :new
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end

  private

  # strong params
  def todo_params
    # same params[:page]
    params.require(:todo).permit(:title)
  end
end
