class Api::V1::ProjectsController < Api::V1::ApplicationController
  load_and_authorize_resource

  def index
    respond_with @projects, include: 'todos'
  end

  def show
    respond_with @project
  end

  def create
    @project.save ? (head :created) : (respond_with @project)
  end

  def update
    @project.update(project_params) ? (head :ok) : (respond_with @project)
  end

  def destroy
    @project.destroy ? (head :ok) : (respond_with @project)
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
