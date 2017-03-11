class Api::V1::TodosController < Api::V1::ApplicationController
  load_and_authorize_resource :project

  load_and_authorize_resource through: :project, shallow: true

  def index
    respond_with @todos
  end

  def show
    respond_with @todo
  end

  def create
    @todo.save ? (head :created) : (respond_with @todo)
  end

  def update
    @todo.update(todo_params) ? (head :ok) : (respond_with @todo)
  end

  def destroy
    @todo.destroy ? (head :ok) : (respond_with @todo)
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :done, :priority, :deadline)
  end
end
