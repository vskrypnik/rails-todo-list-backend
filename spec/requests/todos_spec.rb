require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  let(:user) { create :user }

  let(:headers) { user.create_new_auth_token }

  describe 'GET /todos/:id' do
    it 'responds with 401 (UNAUTHORIZED) if no headers were supplied' do
      get api_v1_todo_path(id: create(:todo).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if todo belongs to another user' do
      get api_v1_todo_path(id: create(:todo).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK) and renders todo' do
      project = create(:project, user: user)
      todo = create(:todo, project: project)

      get api_v1_todo_path(id: todo.id), params: { format: :json }, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('todos/show')
    end
  end

  describe 'PATCH /todos/:id' do
    it 'responds with 401 (UNAUTHORIZED) if no headers were supplied' do
      patch api_v1_todo_path(id: create(:todo).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if project belongs to another user' do
      patch api_v1_todo_path(id: create(:todo).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK)' do
      todo_attributes = attributes_for(:todo)
      project = create(:project, user: user)
      todo = create(:todo, project: project)

      patch api_v1_todo_path(id: todo.id), params: { todo: todo_attributes }, headers: headers

      expect(response).to have_http_status(:ok)
    end

    it 'responds with 422 (UNPROCESSABLE ENTITY)' do
      project = create(:project, user: user)
      todo = create(:todo, project: project)
      todo_attributes = { name: '' }

      patch api_v1_todo_path(id: todo.id), params: { todo: todo_attributes }, headers: headers

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /projects/:project_id/todos' do
    it 'responds with 200 (OK) and renders todos' do
      project = create(:project_with_todos, user: user)

      get api_v1_project_todos_path(project_id: project.id), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('todos/index')
    end
  end

  describe 'POST /projects/:project_id/todos' do
    it 'responds with 200 (OK)' do
      project = create(:project, user: user)
      todo = attributes_for(:todo)

      post api_v1_project_todos_path(project_id: project.id), params: { todo: todo }, headers: headers

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /todos/:id' do
    it 'responds with 401 (UNAUTHORIZED) if no headers supplied' do
      delete api_v1_todo_path(id: create(:todo).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if todo does not belong to user' do
      project = create(:project)
      todo = create(:todo, project: project)

      delete api_v1_todo_path(id: todo.id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK)' do
      project = create(:project, user: user)
      todo = create(:todo, project: project)

      delete api_v1_todo_path(id: todo.id), headers: headers

      expect(response).to have_http_status(:ok)
    end
  end
end
