class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index,]
  respond_to :html, :json

  def index
    if @user
      @todos = @user.todos
    else
      @todos = Todo.all
    end
    respond_with(@todos)
  end

  def show
    respond_with(@todo)
  end

  def new
    @todo = Todo.new
    respond_with(@todo)
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    respond_with(@todo)
  end

  def update
    @todo.update(todo_params)
    respond_with(@todo)
  end

  def destroy
    @todo.destroy
    respond_with(@todo)
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id]) rescue nil
    end

    def todo_params
      params.require(:todo).permit(:title, :description, :completion, :user_id)
    end
end
