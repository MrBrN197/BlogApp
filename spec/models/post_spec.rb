require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'fails to create a post without a author' do
    post = Post.new(title: 'afsdfds', text: 'this is a new post', comments_counter: 0, likes_counter: 0)
    expect(post).to be_invalid
  end

  it 'creates a post correctly with the user' do
    post = Post.new(title: 'afsdfds', text: 'this is a new post', comments_counter: 0, likes_counter: 0)
    post.build_author(name: 'Michael', photo: '', bio: '', posts_counter: 0)
    expect(post).to be_valid
  end

  it 'updates the post_counter correctly' do
    user = User.new(name: 'Michael', photo: '', bio: '', posts_counter: 0)
    expect(user).to be_valid
    Post.create!(title: 'Post 1ere', text: 'this is my post', comments_counter: 0, likes_counter: 0, author: user)
    Post.create!(title: 'Second Post', text: 'this is my post', comments_counter: 0, likes_counter: 0, author: user)
    Post.create!(title: 'Third Post', text: 'this is my post', comments_counter: 0, likes_counter: 0, author: user)
    Post.create!(title: 'Fourth Post', text: 'this is my post', comments_counter: 0, likes_counter: 0, author: user)
    expect(user.posts_counter).to eql(4)
  end

  it 'gets the 5 most recent comments for a post' do
    post = Post.new(title: 'My Post', text: 'this is a post', comments_counter: 0, likes_counter: 0)
    post.build_author(name: 'Michelle', photo: '', bio: '', posts_counter: 0)
    post.save!
    comment_creator = User.new(name: 'Cynthia', photo: '', bio: '', posts_counter: 0)
    expect(comment_creator).to be_valid
    post.comments.create(text: 'this is a comment1', author: comment_creator)
    c2 = post.comments.create(text: 'this is a comment2', author: comment_creator)
    c3 = post.comments.create(text: 'this is a comment3', author: comment_creator)
    c4 = post.comments.create(text: 'this is a comment4', author: comment_creator)
    c5 = post.comments.create(text: 'this is a comment5', author: comment_creator)
    c6 = post.comments.create(text: 'this is a comment6', author: comment_creator)

    recent_five = post.five_recent_comments
    expect(recent_five.length).to eql(5)
    expect(recent_five).to match_array([c6, c5, c4, c3, c2])
  end
end
