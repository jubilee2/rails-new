class TodosController < ApplicationController
  before_action :set_todo, only: %i[update destroy]

  def index
    @todo = current_user.todos.build
    @todos = current_user.todos.recent_first
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      redirect_to todos_path, notice: "Todo added."
    else
      @todos = current_user.todos.recent_first
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @todo.update!(completed: !@todo.completed?)
    redirect_to todos_path, notice: "Todo updated."
  end

  def destroy
    @todo.destroy!
    redirect_to todos_path, notice: "Todo deleted."
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
