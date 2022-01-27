require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'tests that Like model is created correctly' do
    like = Like.new
    like.build_author(name: 'Riley')
    like.build_post(text: '')
    expect(like).to be_valid
  end

  it 'updates a posts likes correctly' do
    user = User.new(name: 'Carrie', email: 'carrie@test.com', password: 'carrie123')
    user.skip_confirmation!
    user2 = User.create!(name: 'Henry', email: 'henry@test.com', password: 'henry123', confirmed_at: Time.now)
    post = user2.posts.create!(title: 'Post1', text: 'This is a post')
    post.likes.create!(author: user)
    # Like.update_likes_for(post)
    expect(post.likes_counter).to eql(1)
  end
end
