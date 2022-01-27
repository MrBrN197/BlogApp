require 'rails_helper'

describe 'In Post Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @mike = User.create!(
      name: 'mike', bio: 'this is my bio', photo: 'test_image1', email: 'mike@gmail.com', password: 'mikemike', confirmed_at: Time.now)
    fill_in 'Email', with: 'mike@gmail.com'
    fill_in 'Password', with: 'mikemike'
    click_button 'Log in'

    post = @mike.posts.create!(
      title: 'Cats and Dogs', text: 'this is first post about cats and dogs!', comments_counter: 0, likes_counter: 0)
    lucy = User.create!(
      name: 'lucy', bio: 'this is my bio',
      photo: 'test_image1', email: 'lucy@gmail.com',
      password: 'lucylucy', confirmed_at: Time.now
    )
    lucy.comments.create!(text: 'really nice post Michael', post: post)
    lucy.comments.create!(text: 'Great', post: post)
    lucy.comments.create!(text: 'fantastic', post: post)
    visit user_post_path(@mike, post)
  end

  describe 'I can see' do
    it 'a post\'s title.' do
      expect(page).to have_content 'Cats and Dogs'
    end

    it 'who wrote the post.' do
      expect(page).to have_content 'mike'
    end

    it 'how many comments it has.' do
      expect(page).to have_content 'Comments 3'
    end

    it 'how many likes it has.' do
      first_post = page.all('.stats')[0]
      expect(first_post).to have_css('.far.fa-heart')
      expect(first_post).to have_content '0'
    end

    it 'the post body.' do
      expect(page).to have_content 'this is first post about cats and dogs!'
    end

    it 'the username of each commentor.' do
      expect(page).to have_content 'lucy'
    end

    it 'the comment each commentor left.' do
      expect(page).to have_content 'really nice post Michael'
      expect(page).to have_content 'Great'
      expect(page).to have_content 'fantastic'
    end
  end
end
