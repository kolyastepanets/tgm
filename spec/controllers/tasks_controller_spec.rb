require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  sign_in_user

  let(:new_task) { build(:task, user: @user) }
  let(:task) { create(:task, user: @user) }
  let(:service) { create(:service) }
  let(:valid_params) do
    { task: { title: new_task.title, service_id: service.id } }
  end
  let(:invalid_params) do
    { task: { title: new_task.title } }
  end

  describe 'GET #index' do
    let!(:tasks) { create_list(:task, 5, user: @user) }

    before { get :index }

    it 'has array of tasks' do
      expect(assigns(:tasks)).to match_array(tasks)
    end

    it 'render index' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new, xhr: true }

    it 'creates new task' do
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'renders #new' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid atrributes' do
      it 'saves new task' do
        post :create, params: valid_params, xhr: true
        expect(Task.count).to eq 1
      end

      it 'should be success' do
        post :create, params: valid_params, xhr: true
        expect(response).to be_success
      end
    end

    context 'with invalid attributes' do
      it 'does not save task' do
        expect { post :create, params: invalid_params, xhr: true }.to_not change(Task, :count)
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: task.id }, xhr: true }

    it 'edits task' do
      expect(assigns(:task)).to eq task
    end

    it 'renders #edit' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    context 'valid attributes' do
      it 'assigns task to @task' do
        put :update, params: { id: task, task: { title: 'new title', service_id: service }}, xhr: true
        expect(assigns(:task)).to eq task
      end

      it 'updates the task' do
        put :update, params: { id: task, task: { title: 'new title', service_id: service }}, xhr: true
        task.reload
        expect(task.title).to eq 'new title'
        expect(task.service).to eq service
      end
    end

    context 'invalid attributes' do
      before { put :update, params: { id: task, task: { title: 'new title' }}, xhr: true }

      it 'does not change attributes' do
        task.reload
        expect(task.title).to eq task.title
      end

      it 'renders #edit' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { task }

    it 'deletes task' do
      expect { delete :destroy, params: { id: task }, xhr: true }.to change(Task, :count).by(-1)
    end
  end
end
