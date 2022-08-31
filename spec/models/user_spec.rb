require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @fisrt_user = User.new(name: 'Mateo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.',
                           postscounter: 0)
    @fisrt_user.save
  end

  it 'user needs a bio' do
    expect(@fisrt_user.bio).to eq('Teacher from Peru.')
  end

  it 'user needs aphoto' do
    expect(@fisrt_user.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
  end

  it 'user needs a name' do
    expect(@fisrt_user.name).to eq('Mateo')
  end

  it 'can\'t save without a name' do
    @fisrt_user.name = nil
    expect(@fisrt_user).to_not be_valid
  end

  it 'can\'t save a posts counter less than 0' do
    @fisrt_user.postscounter = -1
    expect(@fisrt_user).to_not be_valid
  end

  it 'three_recent_post method returns 3 most posts' do
    first = Post.new(author: @fisrt_user, title: 'Title 1', text: 'Text 1', commentscounter: 0, likescounter: 0)
    first.save
    second = Post.new(author: @fisrt_user, title: 'Title 2', text: 'Text 2', commentscounter: 0, likescounter: 0)
    second.save
    third = Post.new(author: @fisrt_user, title: 'Title 3', text: 'Text 3', commentscounter: 0, likescounter: 0)
    third.save
    fourth = Post.new(author: @fisrt_user, title: 'Title 4', text: 'Text 4', commentscounter: 0, likescounter: 0)
    fourth.save
    expect(@fisrt_user.three_recent_post).to eq([fourth, third, second])
  end
end
