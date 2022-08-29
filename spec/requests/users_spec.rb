require 'rails_helper'

RSpec.describe 'testing users_controller', type: :request do
  context 'testing users#index' do
    it 'returns http 200 response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'renders a html containing a <h1>users<h1> tag' do
      get '/users'
      expect(response.body).to include('<h1>users<h1>')
      # expect(response.body).to include('<h1 class="text-xl font-bold">users</h1>')
    end
  end

  context 'test users#show' do
    it 'returns http 200 response' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'renders users#show' do
      get '/users/1'
      expect(response).to render_template(:show)
    end
    
    it 'renders html with <p>Number of Posts:</p>' do
      get '/users/1'
      expect(response.body).to include('Number of Posts:')
    end
  end
end
