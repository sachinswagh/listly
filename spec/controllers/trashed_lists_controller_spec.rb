# frozen_string_literal: true

require 'rails_helper'

describe TrashedListsController do
  let(:list) { FactoryBot.create(:list, active: false) }

  describe 'GET /lists' do
    it 'returns status 200' do
      get :index, format: 'json'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /lists/:id' do
    it 'returns status 200' do
      get :show, format: 'json', params: { id: list.id }
      expect(response.status).to eq(200)
    end
  end
end
