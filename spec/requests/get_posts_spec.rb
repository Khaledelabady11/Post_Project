require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:articles) { create_list(:todo, 20) }
  let(:article_id) { articles.first.id }

  describe 'GET /index' do
    before do
      get '/api/v1/posts'
    end

    it 'returns all posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
