# frozen_string_literal: true

require 'rails_helper'

describe ListsController do
  let(:list) { FactoryBot.create(:list) }

  describe 'GET /lists' do
    it 'returns status 200' do
      get :index, format: 'json'

      aggregate_failures do
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['items'].length).to eq(10)
      end
    end
  end

  describe 'GET /lists/:id' do
    it 'returns status 200' do
      get :show, format: 'json', params: { id: list.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /companies' do
    it 'should return status 200' do
      post :create, format: 'json', params: { list: { name: 'list1' } }
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT /lists/:id' do
    it 'returns status 200' do
      patch :update, format: 'json', params: { id: list.id, list: { name: 'list 1' } }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /lists/:id/soft_delete' do
    it 'returns status 200' do
      delete :soft_delete, format: 'json', params: { id: list.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /lists/:id' do
    it 'returns status 204' do
      delete :destroy, format: 'json', params: { id: list.id }
      expect(response.status).to eq(204)
    end
  end
end
