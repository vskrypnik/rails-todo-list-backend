require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  let(:user) { create :user }

  let(:headers) { user.create_new_auth_token }

  describe 'GET /projects' do
    it 'responds with 401 (UNAUTHORIZED)' do
      get api_v1_projects_path

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK) and renders projects' do
      create_list(:project_with_todos, 3, user: user)

      get api_v1_projects_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('projects/index')
    end
  end

  describe 'POST /projects' do
    it 'responds with 401 (UNAUTHORIZED)' do
      post api_v1_projects_path

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 201 (CREATED)' do
      project = attributes_for(:project)

      post api_v1_projects_path, params: { project: project }, headers: headers

      expect(response).to have_http_status(:created)
    end

    it 'responds with 422 (UNPROCESSABLE ENTITY)' do
      project = { name: '' }

      post api_v1_projects_path, params: { project: project }, headers: headers

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /projects/:project_id/todos' do
    it 'responds with 401 (UNAUTHORIZED) if no headers supplied' do
      get api_v1_project_todos_path(project_id: create(:project).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if project does not belong to user' do
      get api_v1_project_todos_path(project_id: create(:project).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /projects/:project_id/todos' do
    it 'responds with 401 (UNAUTHORIZED) if no headers supplied' do
      post api_v1_project_todos_path(project_id: create(:project).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if project does not belong to user' do
      post api_v1_project_todos_path(project_id: create(:project).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /project/:id' do
    it 'responds with 401 (UNAUTHORIZED) if no headers were supplied' do
      get api_v1_project_path(id: create(:project).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if project belongs to another user' do
      get api_v1_project_path(id: create(:project).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK) and renders project' do
      project = create(:project, user: user)

      get api_v1_project_path(id: project.id), params: { format: :json }, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('projects/show')
    end
  end

  describe 'PATCH /projects/:id' do
    it 'responds with 401 (UNAUTHORIZED) if no headers were supplied' do
      patch api_v1_project_path(id: create(:project).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if project belongs to another user' do
      patch api_v1_project_path(id: create(:project).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK)' do
      project_attributes = attributes_for(:project)
      project = create(:project, user: user)

      patch api_v1_project_path(id: project.id), params: { project: project_attributes }, headers: headers

      expect(response).to have_http_status(:ok)
    end

    it 'responds with 422 (UNPROCESSABLE ENTITY)' do
      project_attributes = { name: '' }
      project = create(:project, user: user)

      patch api_v1_project_path(id: project.id), params: { project: project_attributes }, headers: headers

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /projects/:id' do
    it 'responds with 401 (UNAUTHORIZED) if no headers were supplied' do
      delete api_v1_project_path(id: create(:project).id)

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 401 (UNAUTHORIZED) if project belongs to another user' do
      delete api_v1_project_path(id: create(:project).id), headers: headers

      expect(response).to have_http_status(:unauthorized)
    end

    it 'responds with 200 (OK)' do
      project = create(:project, user: user)

      delete api_v1_project_path(id: project.id), headers: headers

      expect(response).to have_http_status(:ok)
    end
  end
end
