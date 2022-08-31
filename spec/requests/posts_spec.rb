require 'rails_helper'

RSpec.describe 'Posts nested routes', type: :request do
  before do
    @user = User.new(name: 'Mateo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.',
                     postscounter: 0)
    @user.save
    @new_post = Post.new(author: @user, title: 'Title', text: 'Text', commentscounter: 0, likescounter: 0)
    @new_post.save
  end

  context 'post#index' do
    it 'returns http 200 response' do
      get '/users/1/posts'
      puts User.all
      expect(response).to have_http_status(200)
    end

    it 'renders index' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end
  end

  context 'posts#show' do
    it 'returns a 200 response' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'render show view' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end
  end
end
