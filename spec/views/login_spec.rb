require 'rails_helper'

describe 'Login', type: feature do
  before(:each) do
    visit user_session_path
  end

  describe 'login page' do
    it 'has username and password inputs' do
      expect(page).to have_field 'Email'
      expect(page).to have_field 'Password'
      expect(page).to have_button 'Log in'
    end

    it 'displays an error when fields are empty' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    it 'displays an error with the wrong username or password' do
      user = User.new(name: 'Test', email: 'test@gmail.com', password: 'test123')
      user.skip_confirmation!
      user.save!
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'wrongpassword'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password'
    end

    it 'correctly signs new user with correct password in' do
      user = User.new(name: 'Test', email: 'test@gmail.com', password: 'test123')
      user.skip_confirmation!
      user.save!
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'test123'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'correctly signs new user with correct password in' do
      user = User.new(name: 'Test', email: 'test@gmail.com', password: 'test123')
      user.skip_confirmation!
      user.save!
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'test123'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_current_path root_path
    end
  end
end