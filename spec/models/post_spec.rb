require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.new(name: 'Mateo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.',
                     postscounter: 0)
    @user.save
    @new_post = Post.new(author: @user, title: 'Title', text: 'Text', commentscounter: 0, likescounter: 0)
    @new_post.save
  end

  it 'user needs a text' do
    expect(@new_post.text).to eq('Text')
  end

  it 'user needs a title' do
    expect(@new_post.title).to eq('Title')
  end

  it 'can\'t save without a likes less than 0' do
    @new_post.likescounter = -1
    expect(@new_post).to_not be_valid
  end

  it 'can\'t save without a title' do
    @new_post.title = nil
    expect(@new_post).to_not be_valid
  end

  it 'five_recent_comments return 5 recent comments' do
    first = Comment.new(author: @user, text: '1', post: @new_post)
    first.save
    second = Comment.new(author: @user, text: '2', post: @new_post)
    second.save
    third = Comment.new(author: @user, text: '3', post: @new_post)
    third.save
    fourth = Comment.new(author: @user, text: '4', post: @new_post)
    fourth.save
    five = Comment.new(author: @user, text: '5', post: @new_post)
    five.save
    expect(@new_post.five_recent_comments).to eq([five, fourth, third, second, first])
  end

  it 'user needs an author' do
    expect(@new_post.author).to eq(@user)
  end

  it 'can\'t save without comments less than 0' do
    @new_post.commentscounter = -1
    expect(@new_post).to_not be_valid
  end
end
