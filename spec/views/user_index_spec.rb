require 'rails_helper'

describe 'User Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @mike = User.create!(
      name: 'mike', photo: 'test_image1', email: 'mike@gmail.com',
      password: 'mikemike', confirmed_at: Time.now, posts_counter: 4
    )
    User.create!(
      name: 'mary', photo: 'test_image2', email: 'mary@gmail.com',
      password: 'marymary', confirmed_at: Time.now, posts_counter: 3
    )
    User.create!(
      name: 'chris', photo: 'test_image3', email: 'chris@gmail.com',
      password: 'chrischris', confirmed_at: Time.now, posts_counter: 1
    )
    fill_in 'Email', with: 'mary@gmail.com'
    fill_in 'Password', with: 'marymary'
    click_button 'Log in'
    visit users_path
  end

  describe 'index page' do
    it 'it should display all users' do
      expect(page).to have_content('mary')
      expect(page).to have_content('mike')
      expect(page).to have_content('chris')
    end

    it 'should have the correct user image' do
      imgs = page.all('img')
      expect(imgs.size).to eql 3
      # NOTE: users are rendered in the alphabetical order
      expect(imgs[0]['src']).to eql 'test_image3'
      expect(imgs[1]['src']).to eql 'test_image2'
      expect(imgs[2]['src']).to eql 'test_image1'
    end

    it 'should have the correct number of posts displayed' do
      subs = page.all('.sub')
      expect(subs[0]).to have_content 'Number of posts 1'
      expect(subs[1]).to have_content 'Number of posts 3'
      expect(subs[2]).to have_content 'Number of posts 4'
    end

    it 'ensures clicking the user redirect to the users page' do
      click_link 'mike'
      expect(page).to have_current_path user_posts_path(@mike)
    end
  end
end
