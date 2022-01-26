require 'rails_helper'

describe 'Post Index Page', type: feature do
  before(:each) do
    visit user_session_path
    @mike = User.create!(
      name: 'mike', bio: 'this is my bio', photo: 'test_image1', email: 'mike@gmail.com', password: 'mikemike', confirmed_at: Time.now)
    fill_in 'Email', with: 'mike@gmail.com'
    fill_in 'Password', with: 'mikemike'
    click_button 'Log in'

    @post1 = @mike.posts.create!(
      title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
    @mike.posts.create!(
      title: 'Post2', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
    @mike.posts.create!(
      title: 'Three', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)

    # Comments
    lucy = User.create!(
      name: 'lucy', bio: 'this is my bio',
      photo: 'test_image1', email: 'lucy@gmail.com',
      password: 'lucylucy', confirmed_at: Time.now
    )
    lucy.comments.create!(text: 'really nice post Michael', post: @post1)
    lucy.comments.create!(text: 'Great', post: @post1)
    lucy.comments.create!(text: 'fantastic', post: @post1)
    visit user_posts_path(@mike)
  end

  describe 'index page' do
    it 'can see the user\'s profile picture' do
      image_src = page.find('img')['src']
      expect(image_src).to eql 'test_image1'
    end

    it 'can see the user\'s username' do
      expect(page).to have_content 'mike'
    end

    # it 'can see the user\'s bio' do
    #   expect(page).to have_content 'this is my bio'
    # end

    it 'I can see the number of posts the user has written' do
      posts = page.all('.posts .post')
      puts posts.size
      puts page.current_path
      expect(page).to have_content 'Number of posts 3'
    end

    it 'I can see a post\'s title.' do
      expect(page).to have_content 'Cats and Dogs'
    end

    it 'I can see some of the post\'s body.' do
      expect(page).to have_content 'this is first post about cats and dogs!'
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content 'really nice post Michael'
      expect(page).to have_content 'Great'
      expect(page).to have_content 'fantastic'
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments 3'
    end

    it 'I can see how many likes a post has.' do
      first_post = page.all('.stats')[0]
      expect(first_post).to have_css('.far.fa-heart')
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_link 'See All My Posts'
    end

    it 'When I click on a post, it redirects me to that post\'s show page.' do
      click_link 'Cats and Dogs'
      expect(page).to have_current_path(user_post_path(@mike, @post1))
    end
  end
end
