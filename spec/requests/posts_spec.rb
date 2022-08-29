require 'rails_helper'

RSpec.describe 'Posts nested routes', type: :request do
  context 'GET /users/:user_id/posts' do
    it 'returns http 200 response' do
      get 'http post#index'
      expect(response).to have_http_status(200)
    end

    it 'renders index' do
      get 'post#index'
      expect(response).to render_template(:index)
    end
  end

  context 'GET /users/:user_id/posts/:id' do
    it 'returns a 200 response' do
      get 'http post#show'
      expect(response).to have_http_status(200)
    end

    it 'render show view' do
      get 'post#show'
      expect(response).to render_template(:show)
    end
  end
end
