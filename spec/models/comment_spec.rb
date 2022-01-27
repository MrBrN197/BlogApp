require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'add some examples to (or delete)' do
    author = User.new(name: 'Mandy', email: 'mandy@test.com', password: 'mandymandy', photo: '', bio: '',
                      posts_counter: 0)
    author.skip_confirmation!
    post = Post.new(title: 'Frustrating...', text: 'I haven\'t completed things...', author: author)
    post.save!

    comment_creator = User.new(name: 'Mike', email: 'mike@test.com', password: 'mike123', photo: '', bio: '',
                               posts_counter: 0)
    comment_creator.skip_confirmation!
    post.comments.create!(text: 'nice one', author: comment_creator)
    post.comments.create!(text: 'really nice post', author: comment_creator)
    expect(post.comments.length).to eql(2)
  end
end
