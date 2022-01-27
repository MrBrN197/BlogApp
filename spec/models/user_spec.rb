require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Alex', photo: '', bio: '', email: 'alex@test.com', password: 'alexalex', confirmed_at: Time.now) }
  before { subject.save! }

  describe 'Test validations are correct' do
    it 'test the user is invalid without a name' do
      expect(subject).to be_valid
      subject.name = nil
      expect(subject).to_not be_valid
      subject.name = ''
      expect(subject).to_not be_valid
    end
    it 'test the user is invalid without post_counter' do
      expect(subject).to be_valid
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

  it 'test that the user is created properly' do
    name = 'Alfred'
    photo = 'https://images.unsplash.com/photo-1642024728966-7492bae9bb60?w=300'
    email = 'alfred@test.com'
    password = 'alfred123'
    user = User.new(name: name, email: email, password: password, photo: photo, bio: 'Hi', posts_counter: 0)
    user.skip_confirmation!
    expect(user).to be_valid
  end

  it 'tests that the first_three method works correctly' do
    user = User.create!(
      name: 'Sarah', email: 'sarah@test.com', 
      password: 'sarah123', photo: '', 
      bio: '', posts_counter: 0, confirmed_at: Time.now
    )
    user.posts.create(title: 'Post 1', text: 'This is my first post')
    user.posts.create(title: 'Post 2', text: 'This is my second post')
    p3 = user.posts.create(title: 'Post 3', text: 'This is my third post')
    p4 = user.posts.create(title: 'Post 4', text: 'This is my fourth post')
    p5 = user.posts.create(title: 'Post 5', text: 'This is my fifth post')
    expect(user.posts.length).to eql(5)
    first_three_posts = user.first_three
    expect(first_three_posts.length).to eql(3)
    expect(first_three_posts).to match_array([p5, p4, p3])
  end
end
