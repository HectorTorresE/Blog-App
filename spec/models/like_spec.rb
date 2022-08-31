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

  it 'plus_counter increments the post likes counter by 1' do
    expect(@new_post.likescounter).to eq(1)
    @new_like.plus_counter
    expect(@new_post.likescounter).to eq(2)
  end

  it 'minus_counter decrements the post likes counter by 1' do
    expect(@new_post.likescounter).to eq(1)
    @new_like.plus_counter
    expect(@new_post.likescounter).to eq(2)
    @new_like.minus_counter
    expect(@new_post.likescounter).to eq(1)
  end
end
