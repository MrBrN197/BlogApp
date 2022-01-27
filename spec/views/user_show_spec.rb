require 'rails_helper'

describe 'User Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @mike = User.create!(
      name: 'mike', bio: 'this is my bio', photo: 'test_image1', email: 'mike@gmail.com', password: 'mikemike', confirmed_at: Time.now, posts_counter: 4)
    fill_in 'Email', with: 'mike@gmail.com'
    fill_in 'Password', with: 'mikemike'
    click_button 'Log in'

    @post1 = @mike.posts.create!(
      title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
    @mike.posts.create!(
      title: 'Post2', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
    @mike.posts.create!(
      title: 'Three', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)

    # visit user_posts_path(@mike)
    visit user_path(@mike)
  end

  describe 'show page tests' do
    it 'can see the user\'s profile picture' do
      image_src = page.find('img')['src']
      expect(image_src).to eql 'test_image1'
    end

    it 'can see the user\'s username' do
      expect(page).to have_content 'mike'
    end

    it 'can see the user\'s bio' do
      visit user_path(@mike)
      expect(page).to have_content 'this is my bio'
    end

    it 'I can see the user\'s first three posts' do
      posts = page.all('.posts .post')
      expect(posts.length).to eql 3
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      click_link 'Cats and Dogs'
      expect(page).to have_current_path(user_post_path(@mike, @post1))
    end

    # it 'I can see a button that lets me view all of a user\'s posts.' do
    #   expect(page).to have_link 'See All My Posts'
    # end

    # it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    #   click_link 'See All My Posts'
    #   expect(page).to have_current_path(user_path(@mike))
    # end
  end
end
