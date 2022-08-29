require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Mateo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.',
                       postscounter: 0)
    @user.save
    @new_post = Post.new(author: @user, title: 'Title', text: 'Text', commentscounter: 0, likescounter: 0)
    @new_post.save
    @new_like = Like.new(author: @user, post: @new_post)
    @new_like.save
  end

  it 'update_like_counter_add increments the post likes counter by 1' do
    expect(@new_post.likescounter).to eq(0)
    @new_like.update_like_counter_add
    expect(@new_post.likescounter).to eq(1)
  end

  it 'update_like_counter_remove decrements the post likes counter by 1' do
    expect(@new_post.likescounter).to eq(0)
    @new_like.update_like_counter_add
    expect(@new_post.likescounter).to eq(1)
    @new_like.update_like_counter_remove
    expect(@new_post.likescounter).to eq(0)
  end
end
