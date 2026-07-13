class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[update destroy]

  def index
    @todo = Todo.new
    @todos = Todo.where(owner_email: current_user_email).recent_first
  end

  def create
    @todo = Todo.new(todo_params.merge(owner_email: current_user_email))

    if @todo.save
      redirect_to todos_path, notice: "Todo added."
    else
      @todos = Todo.where(owner_email: current_user_email).recent_first
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
    @todo = Todo.find_by!(id: params[:id], owner_email: current_user_email)
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
